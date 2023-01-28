import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Services {
  // this function is called when the app launches
  static Future<List> loadData() async {
    List posts = [];
    try {
      // This is an open REST API endpoint for testing purposes
      const apiUrl = 'https://jsonplaceholder.typicode.com/posts';

      final http.Response response = await http.get(Uri.parse(apiUrl));
      posts = json.decode(response.body);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }

    return posts;
  }
}
