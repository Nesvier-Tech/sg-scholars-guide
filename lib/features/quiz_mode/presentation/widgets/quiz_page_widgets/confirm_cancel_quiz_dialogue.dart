import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmCancelQuizDialogue extends StatelessWidget {
  const ConfirmCancelQuizDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Cancel Confirmation',
          style: TextStyle(fontWeight: FontWeight.bold)),
      content: const Text("You can't go back after this! Are you sure?"),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: const Text(
                'Go Back',
                style: TextStyle(color: Color.fromRGBO(128, 0, 0, 1)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                GoRouter.of(context).go('/quiz-mode');
              },
            ),
            TextButton(
              child: const Text(
                'Continue Quiz',
                style: TextStyle(color: Color.fromRGBO(128, 0, 0, 1)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
