import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmCancelQuizDialogue extends StatelessWidget {
  const ConfirmCancelQuizDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Cancel Confirmation'),
      content: const Text("You can't go back after this! Are you sure?"),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: const Text('Continue Quiz'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Go Back'),
              onPressed: () {
                Navigator.of(context).pop();
                GoRouter.of(context).go('/quiz-mode');
              },
            ),
          ],
        ),
      ],
    );
  }
}
