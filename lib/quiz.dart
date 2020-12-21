import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionLists;
  final int questionIndex;
  final Function answerChosen;

  Quiz({
    @required this.questionLists,
    @required this.answerChosen,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionLists[questionIndex]["question"]),
        ...(questionLists[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((e) => Answer(() => answerChosen(e["score"]), e["text"])),
      ],
    );
  }
}
