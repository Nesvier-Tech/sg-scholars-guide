// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/finished_quiz_page.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz/quiz_bloc.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz_card/quiz_card_cubit.dart';

class ConfirmSubmitQuizDisplay extends StatelessWidget {
  const ConfirmSubmitQuizDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
          ),
          child: AlertDialog(
            title: const Text('Submit Confirmation'),
            content: const Text("You can't go back after this! Are you sure?"),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Submit Quiz'),
                onPressed: () {
                  Map<SUBJ, List<QuizCardCubit>> subjectQuestionsMap =
                      context.read<QuizBloc>().subjectQuestionsMap;

                  for (List<QuizCardCubit> subject
                      in subjectQuestionsMap.values) {

                    for (QuizCardCubit questionCubit in subject) {
                      if (questionCubit.state is QuizCardUnanswered) {
                        questionCubit.revealAnswer(
                            index: -1);
                      }
                      if (questionCubit.state is QuizCardAnswered) {
                        questionCubit.revealAnswer(
                            index: questionCubit.state.props[0] as int);
                      }
                    }
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (newContext) => (FinishedQuizPage(
                            subjectQuestionsMap:
                                context.read<QuizBloc>().subjectQuestionsMap,
                            subject: context.read<QuizBloc>().subject)),
                      ));
                },
              ),
              ElevatedButton(
                child: const Text('Go Back'),
                onPressed: () {
                  context.read<QuizBloc>().add(QuizConfirmFinishBtnPressed());
                },
              ),
            ],
          )),
    );
  }
}
