import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz/quiz_bloc.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz_card/quiz_card_cubit.dart';

class ConfirmSubmitQuizDialogue extends StatelessWidget {
  const ConfirmSubmitQuizDialogue({super.key, required this.quizBloc});

  final QuizBloc quizBloc;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Submit Confirmation'),
      content: const Text("You can't go back after this! Are you sure?"),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Submit Quiz'),
          onPressed: () {
            final SUBJ subject = quizBloc.subject;
            Map<SUBJ, List<QuizCardCubit>> subjectQuestionsMap =
                quizBloc.subjectQuestionsMap;

            for (List<QuizCardCubit> subject in subjectQuestionsMap.values) {
              for (QuizCardCubit questionCubit in subject) {
                if (questionCubit.state is QuizCardUnanswered) {
                  questionCubit.revealAnswer(index: -1);
                }
                if (questionCubit.state is QuizCardAnswered) {
                  questionCubit.revealAnswer(
                      index: questionCubit.state.props[0] as int);
                }
              }
            }
            Navigator.of(context).pop();
            GoRouter.of(context).go('/quiz-mode/finished-quiz', extra: {
              'subjectQuestionsMap': subjectQuestionsMap,
              'subject': subject
            });
          },
        ),
        ElevatedButton(
          child: const Text('Go Back'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
