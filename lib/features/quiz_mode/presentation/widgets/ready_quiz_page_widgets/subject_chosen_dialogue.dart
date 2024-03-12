import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scholars_guide/core/models/question_model.dart';

class SubjectChosenDialogue extends StatelessWidget {
  const SubjectChosenDialogue({super.key, required this.subjectTest});

  final String subjectTest;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmation'),
      content: Text("Let's start answering $subjectTest! Are you ready?"),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Start'),
          onPressed: () {
            Navigator.of(context).pop();
            GoRouter.of(context).go('/quiz-mode/start-quiz',
                extra: Question.string2SUBJ(subjectTest));
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
