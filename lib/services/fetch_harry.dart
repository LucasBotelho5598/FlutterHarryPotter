import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:harrypotter_flutter/model/harry.dart';
import 'package:http/http.dart' as http;

Future<List<Harry>> fetchHarry(http.Client client) async {
  final response = await client.get(
    Uri.parse('https://hp-api.onrender.com/api/characters'),
  );
  
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Harry> parsePhotos(String responseBody) {
  final parsed = (jsonDecode(responseBody) as List<Object?>)
      .cast<Map<String, Object?>>();

  return parsed.map<Harry>(Harry.fromJson).toList();
}
