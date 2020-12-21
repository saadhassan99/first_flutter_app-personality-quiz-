import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionLists = [
    {
      "question": "Who's your favorite professor?",
      "answers": [
        {"text": "audrey", "score": 100},
        {"text": "taylor", "score": 34},
        {"text": "brian", "score": 56},
        {"text": "Kevin", "score": 23},
      ],
    },
    {
      "question": "Whats your favourite color?",
      "answers": [
        {"text": "red", "score": 34},
        {"text": "blue", "score": 56},
        {"text": "black", "score": 233},
        {"text": "white", "score": 23},
      ],
    },
    {
      "question": "Whats your cat's name?",
      "answers": [
        {"text": "jack", "score": 34},
        {"text": "hazel", "score": 67},
        {"text": "bazel", "score": 55},
        {"text": "oliver", "score": 66},
      ],
    },
  ];

  int questionIndex = 0;
  int _totalScore = 0;

  void _reset(){
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerChosen(int score) {
    _totalScore += score;
    setState(() {
      questionIndex += 1;
    });
    if (questionIndex < _questionLists.length) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app"),
        ),
        body: questionIndex < _questionLists.length
            ? Quiz(
                answerChosen: _answerChosen,
                questionIndex: questionIndex,
                questionLists: _questionLists,
              )
            : Result(_totalScore, _reset),
      ),
    );
  }
}
