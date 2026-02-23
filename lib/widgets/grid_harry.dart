import 'package:flutter/material.dart';
import 'package:harrypotter_flutter/model/harry.dart';

class GridHarry extends StatelessWidget {
  const GridHarry({super.key, required this.harry});

  final List<Harry> harry;

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: harry.length,
        itemBuilder: (context, index) {
          return Container(   
                   
            
            child: Column(children: [
              Text(harry[index].name),
              Expanded(child: Image.network(harry[index].image, fit: BoxFit.cover,))
              
            ],),
                      
          );
                  
        },
      ),
    );
  }
}
