import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function reset;

  String get resultPhrase {
    String resultText;
    if (resultScore > 100) {
      resultText = "You are good";
    } else if (resultScore > 200) {
      resultText = "You are really awesome!";
    } else {
      resultText = "You are the bad";
    }
    return resultText;
  }

  Result(this.resultScore, this.reset);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30),
          ),
          FlatButton(onPressed: reset, child: Text("Restart quiz"))
        ],
      ),
    );
  }
}
