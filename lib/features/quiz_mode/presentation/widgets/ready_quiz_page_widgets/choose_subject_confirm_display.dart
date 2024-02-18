// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/quiz_page.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/ready_quiz/ready_quiz_cubit.dart';

class ChooseSubjectConfirmDisplay extends StatelessWidget {
  const ChooseSubjectConfirmDisplay({super.key, required this.subject});

  final SUBJ subject;

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
            title: Text('Confirmation'),
            content: Text(
                "Let's start answering ${Question.SUBJ2string(subject)}! Are you ready?"),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Start'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (QuizPage(subject: subject))),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Go Back'),
                onPressed: () {
                  BlocProvider.of<ReadyQuizCubit>(context).chooseAgain();
                },
              ),
            ],
          )),
    );
  }
}
