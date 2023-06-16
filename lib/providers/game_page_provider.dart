import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQuestion = 10;
  List? questions;
  int currentQuestion = 1;
  BuildContext context;
  GamePageProvider({required this.context}) {
    _dio.options.baseUrl = 'https://opentdb.com/api.php';
    _getQuestionsFromAPI();
  }

  Future<void> _getQuestionsFromAPI() async {
    var response = await _dio.get('', queryParameters: {
      'amount': 10,
      'type': "boolean",
      "difficulty": 'easy',
    });

    var _data = jsonDecode(response.toString());
    questions = _data['results'];
    notifyListeners();
  }

  String getCurrentQuestion() {
    return questions![currentQuestion]['question'];
  }
}
