// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/question_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/timer_display.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.subject});

  final SUBJ subject;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionDisplay(),
        TimerDisplay(),
      ],
    );
  }
}
