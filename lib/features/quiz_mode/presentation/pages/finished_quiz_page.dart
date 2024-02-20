// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz_card/quiz_card_cubit.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_widgets/question_display.dart';

import 'ready_quiz_page.dart';

class FinishedQuizPage extends StatelessWidget {
  const FinishedQuizPage({super.key, required this.subjectQuestionsMap, required this.subject});

  final Map<SUBJ, List<QuizCardCubit>> subjectQuestionsMap;
  final SUBJ subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Results'),
        ),
        body: Center(
          child: Column(
            children: [
              Text("Congrats on finishing! Let's see how you did"),

              QuestionDisplay(
                            subjectQuestionsMap: subjectQuestionsMap,
                            subject: subject),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (ReadyQuizPage())),
                  );
                },
                child: Text('Take Another Quiz'),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Push to the home page
                },
                child: Text("Back to the home page"),
              ),
            ],
          ),
        ));
  }
}
