// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/ready_quiz_page.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input_page/quiz_input_page_bloc.dart';

// ! Currently not used
class ConfirmCancelQuizInputDisplay extends StatelessWidget {
  const ConfirmCancelQuizInputDisplay({super.key});

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
          title: const Text('Cancel Quiz Input',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text("Your inputs will be discared! Are you sure?"),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: const Text(
                    'Go Back',
                    style: TextStyle(color: Color.fromRGBO(207, 0, 15, 1)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (ReadyQuizPage()),
                      ), // ! Change to home page
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text(
                    'Continue Quiz Input',
                    style: TextStyle(color: Color.fromRGBO(207, 0, 15, 1)),
                  ),
                  onPressed: () {
                    context
                        .read<QuizInputPageBloc>()
                        .add(QuizInputPageCancelBackBtnPressed());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
