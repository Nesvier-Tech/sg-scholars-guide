// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'question_card_display.dart';

// Holds multiple question answer cards
class QuestionDisplay extends StatefulWidget {
  const QuestionDisplay({super.key});

  @override
  State<QuestionDisplay> createState() => _QuestionDisplayState();
}

class _QuestionDisplayState extends State<QuestionDisplay> {
  List<QuestionAnswerCard> questionAnswerCards = [
    QuestionAnswerCard(),
    QuestionAnswerCard(),
    QuestionAnswerCard()
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView(children: [...questionAnswerCards]));
  }
}

