// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/finished_quiz_page.dart';

class ConfirmTimeOutQuizDisplay extends StatelessWidget {
  const ConfirmTimeOutQuizDisplay({super.key});

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
            title: const Text('Out of Time'),
            content: const Text("You did great! Let's see you did"),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Submit Quiz'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (FinishedQuizPage())),
                  );
                },
              ),
            ],
          )),
    );
  }
}
