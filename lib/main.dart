import 'package:flutter/material.dart';
import 'package:harrypotter_flutter/model/harry.dart';
import 'package:harrypotter_flutter/services/fetch_harry.dart';
import 'package:harrypotter_flutter/widgets/grid_harry.dart';
import 'package:http/http.dart' as http show Client;

void main() => runApp(Main());

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  late Future<List<Harry>> futureCharacters;

  @override
  void initState() {
    super.initState();
    futureCharacters = fetchHarry(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<List<Harry>>(
          future: futureCharacters,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Error");
            } else if (snapshot.hasData) {
              return GridHarry(harry: snapshot.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
