// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/ready_quiz_page.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz/quiz_bloc.dart';

class ConfirmCancelQuizDisplay extends StatelessWidget {
  const ConfirmCancelQuizDisplay({super.key});

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
            title: const Text('Cancel Confirmation'),
            content: const Text("You can't go back after this! Are you sure?"),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Continue Quiz'),
                onPressed: () {
                  context.read<QuizBloc>().add(QuizConfirmCancelBtnPressed());
                },
              ),
              ElevatedButton(
                child: const Text('Go Back'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (ReadyQuizPage())),
                  );
                },
              ),
            ],
          )),
    );
  }
}