// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz_card/quiz_card_cubit.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_widgets/question_card_choices_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_widgets/question_card_question_display.dart';

class QuestionCardDisplay extends StatefulWidget {
  const QuestionCardDisplay(
      {super.key,
      required this.bloc,
      required this.choices,
      required this.correctIndex,
      required this.question});

  final QuizCardCubit bloc;
  final List<String> choices;
  final int correctIndex;
  final String question;

  @override
  State<QuestionCardDisplay> createState() => _QuestionCardDisplayState();
}

class _QuestionCardDisplayState extends State<QuestionCardDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(7.0),
        ),
        // alignment: Alignment.center,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            QuestionCardQuestionDisplay(question: widget.question),
            QuestionCardChoicesDisplay(
                bloc: widget.bloc)
          ],
        ));
  }
}
