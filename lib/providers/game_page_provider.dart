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

  void answerQuestion(String _answer) async {
    bool isCorrect = questions![currentQuestion]['correct_answer'] == _answer;
    currentQuestion++;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: isCorrect ? Colors.green : Colors.red,
            title: Icon(
              isCorrect ? Icons.check_circle : Icons.cancel_sharp,
              color: Colors.white,
            ),
          );
        });
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
    if (currentQuestion == _maxQuestion) {
      endGame();
    } else {
      notifyListeners();
    }
  }

  Future<void> endGame() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            backgroundColor: Colors.blue,
            title: Text(
              "End Game! ",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            content: Text("Score : 0/0"),
          );
        });
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
