// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input_page/quiz_input_page_bloc.dart';

class ConfirmSubmitQuizInputDialogue extends StatelessWidget {
  const ConfirmSubmitQuizInputDialogue(
      {super.key, required this.quizInputPageBloc});

  final QuizInputPageBloc quizInputPageBloc;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Submit Confirmation'),
      content: const Text("Your questions will be submitted! Are you sure?"),
      actions: <Widget>[
        TextButton(
          child: const Text('Submit Questions'),
          onPressed: () {
            Navigator.of(context).pop();
            quizInputPageBloc.add(QuizInputPageSubmitBtnPressed());

            if (quizInputPageBloc.isSubmittable()) {
              GoRouter.of(context)
                  .go('/quiz-upload/finished-quiz-upload', extra: {
                'questionsToUpload': quizInputPageBloc.questions,
                'subjToUpload': quizInputPageBloc.subject,
              });
              quizInputPageBloc.add(QuizInputPageReset());
            }
          },
        ),
        TextButton(
          child: const Text('Go Back'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
