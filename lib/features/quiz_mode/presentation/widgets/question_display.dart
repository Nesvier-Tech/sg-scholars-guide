// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:scholars_guide/core/models/question_model.dart';

import 'question_card_display.dart';

// Holds multiple question answer cards
class QuestionDisplay extends StatefulWidget {
  const QuestionDisplay({super.key, required this.questions});

  final List<Question> questions;

  @override
  State<QuestionDisplay> createState() => _QuestionDisplayState();
}

class _QuestionDisplayState extends State<QuestionDisplay> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.questions.length,
          itemBuilder: (context, index) {
            return QuestionAnswerCard(
                choices: widget.questions[index].options,
                correctChoiceKey:
                    widget.questions[index].correctIndex.toString(),
                question: widget.questions[index].question);
          }),
    );
  }
}
