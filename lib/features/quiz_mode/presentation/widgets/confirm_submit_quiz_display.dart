// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/finished_quiz_page.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz/quiz_bloc.dart';

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (FinishedQuizPage())),
                  );
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
