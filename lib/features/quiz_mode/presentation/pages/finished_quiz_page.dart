// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz_card/quiz_card_cubit.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_widgets/question_display.dart';

class FinishedQuizPage extends StatelessWidget {
  const FinishedQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final extraMap = GoRouterState.of(context).extra as Map<String, dynamic>;
    final SUBJ subject = extraMap['subject'] as SUBJ;
    final Map<SUBJ, List<QuizCardCubit>> subjectQuestionsMap =
        extraMap['subjectQuestionsMap'] as Map<SUBJ, List<QuizCardCubit>>;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Quiz Results'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Congrats on finishing! Let's see how you did",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              QuestionDisplay(
                  subjectQuestionsMap: subjectQuestionsMap, subject: subject),

              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/quiz-mode');
                },
                child: Text('Take Another Quiz'),
              ),

              SizedBox(
                height: 20,
              ),

              // ElevatedButton(
              //   onPressed: () {
              //   },
              //   child: Text("Back to the home page"),
              // ),
            ],
          ),
        ));
  }
}
