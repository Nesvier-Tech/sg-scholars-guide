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

    final int score =
        countCorrect(quizCardCubitList: subjectQuestionsMap[subject]!);
    final int scorePercentage =
        ((score / subjectQuestionsMap[subject]!.length) * 100).round();

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
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Congrats on finishing! Let's see how you did",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      "Score",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "$score/${subjectQuestionsMap[subject]?.length}",
                        style: TextStyle(
                            color: scorePercentage <= 60
                                ? Colors.red
                                : scorePercentage <= 80
                                    ? Colors.orange
                                    : Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).go(
                          '/quiz-mode/solutions-quiz',
                          extra: {
                            'subjectQuestionsMap': subjectQuestionsMap,
                            'subject': subject
                          },
                        );
                      },
                      child: Text("Review"),
                    ),
                  ],
                ),
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
          ],
        ),
      ),
    );
  }
}

int countCorrect({required List<QuizCardCubit> quizCardCubitList}) {
  int count = 0;
  for (QuizCardCubit cubit in quizCardCubitList) {
    if (cubit.state.chosenIndex == cubit.correctIndex) {
      count++;
    }
  }
  return count;
}
