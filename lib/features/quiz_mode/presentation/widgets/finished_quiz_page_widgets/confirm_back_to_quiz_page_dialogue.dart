import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmBackToQuizPageDialogue extends StatelessWidget {
  const ConfirmBackToQuizPageDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Back to Quiz Page',
          style: TextStyle(fontWeight: FontWeight.bold)),
      content:
          const Text("Finished Reviewing? You will go back to the Quiz Page."),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: const Text(
                "Take Again",
                style: TextStyle(color: Color.fromRGBO(207, 0, 15, 1)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                GoRouter.of(context).go('/quiz-mode');
              },
            ),
            TextButton(
              child: const Text(
                'Continue Reviewing',
                style: TextStyle(color: Color.fromRGBO(207, 0, 15, 1)),
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
