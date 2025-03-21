import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIService {
  static const String baseURL = 'https://api.frontendexpert.io/api/fe/wordle-words';
  static bool isLoading = false;

  static Future<String> fetchWord() async {
    isLoading = true;
    try {
      final response = await http.get(Uri.parse(baseURL));
      if(response.statusCode == 200) {
        final List<dynamic> words = jsonDecode(response.body);
        final randomIndex = Random().nextInt(words.length);
        return words[randomIndex];
      } else {
        // Handle non-200 status codes
        debugPrint('Failed to load words. Status code: ${response.statusCode}');
        return ''; 
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return 'Failed to load word';
    } finally {
      isLoading = false;
    }
  }
}
