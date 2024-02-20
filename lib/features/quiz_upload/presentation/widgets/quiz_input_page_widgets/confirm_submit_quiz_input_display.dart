// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/pages/upload_success_page.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input_page/quiz_input_page_bloc.dart';

class ConfirmSubmitQuizInputDisplay extends StatelessWidget {
  const ConfirmSubmitQuizInputDisplay({super.key});

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
            content:
                const Text("Your questions will be submitted! Are you sure?"),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Submit Questions'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (newContext) => (UploadSuccessPage(
                          questionsToUpload:
                              context.read<QuizInputPageBloc>().questions,
                          subjToUpload: context
                              .read<QuizInputPageBloc>()
                              .subject,
                        )),
                      ));
                },
              ),
              ElevatedButton(
                child: const Text('Go Back'),
                onPressed: () {
                  context
                      .read<QuizInputPageBloc>()
                      .add(QuizInputPageCancelSubmitBtnPressed());
                },
              ),
            ],
          )),
    );
  }
}
