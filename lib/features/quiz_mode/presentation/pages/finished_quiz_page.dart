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
      backgroundColor: const Color.fromRGBO(128, 0, 0, 1),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(128, 0, 0, 1),
          title: Center(
            child: Text('Quiz Results',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).go('/quiz-mode');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(128, 0, 0, 1),
                      ),
                    ),
                    child: Text(
                      "Take Another Quiz",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).go(
                        '/quiz-mode/solutions-quiz',
                        extra: {
                          'subjectQuestionsMap': subjectQuestionsMap,
                          'subject': subject
                        },
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(128, 0, 0, 1),
                      ),
                    ),
                    child: Text(
                      "View Solutions",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Congrats on finishing! Let's see how you did",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                    ),
                    Text(
                      "Score",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            QuestionDisplay(
              subjectQuestionsMap: subjectQuestionsMap,
              subject: subject,
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
