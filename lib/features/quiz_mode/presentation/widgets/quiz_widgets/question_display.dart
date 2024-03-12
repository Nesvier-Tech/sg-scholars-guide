// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz_card/quiz_card_cubit.dart';

import 'question_card_display.dart';

// Holds multiple question answer cards
class QuestionDisplay extends StatefulWidget {
  const QuestionDisplay(
      {super.key, required this.subjectQuestionsMap, required this.subject});

  final SUBJ subject;
  final Map<SUBJ, List<QuizCardCubit>> subjectQuestionsMap;

  @override
  State<QuestionDisplay> createState() => _QuestionDisplayState();
}

class _QuestionDisplayState extends State<QuestionDisplay> {
  @override
  Widget build(BuildContext context) {
    List<QuizCardCubit> questions = widget.subjectQuestionsMap[widget.subject]!;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return QuestionCardDisplay(
            bloc: questions[index],
            choices: questions[index].optionsArray,
            correctIndex: questions[index].correctIndex,
            question: questions[index].question);
      },
    );
  }
}
