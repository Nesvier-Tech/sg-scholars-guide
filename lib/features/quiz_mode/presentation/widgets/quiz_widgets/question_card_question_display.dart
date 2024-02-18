import 'package:flutter/material.dart';

class QuestionCardQuestionDisplay extends StatelessWidget {
  const QuestionCardQuestionDisplay({super.key, required this.question});

  final String question;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Align(
            alignment: Alignment.center,
            child: Container(
                margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                child:
                    Text(question, style: const TextStyle(fontSize: 17.0)))));
  }
}
