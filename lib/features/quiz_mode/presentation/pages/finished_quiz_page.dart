// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/ready_quiz_page.dart';

class FinishedQuizPage extends StatelessWidget {
  const FinishedQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scholar\'s Guide'),
        ),
        body: Center(
          child: Column(
            children: [
              Text("You did great! Let's see how you did"),

              // TODO: Results display

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (ReadyQuizPage())),
                  );
                },
                child: Text('Take Another Quiz'),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: Push to the home page
                },
                child: Text("Back to the home page"),
              ),
            ],
          ),
        ));
  }
}
