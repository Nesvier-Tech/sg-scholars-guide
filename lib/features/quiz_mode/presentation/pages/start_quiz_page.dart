// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/question_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/timer_display.dart';

class StartQuizPage extends StatefulWidget {
  const StartQuizPage({super.key});

  @override
  State<StartQuizPage> createState() => _StartQuizPageState();
}

class _StartQuizPageState extends State<StartQuizPage> {
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
