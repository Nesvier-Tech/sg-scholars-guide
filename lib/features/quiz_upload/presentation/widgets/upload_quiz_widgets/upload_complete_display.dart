// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/ready_quiz_page.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/pages/upload_questions_page.dart';

class UploadCompleteDisplay extends StatelessWidget {
  UploadCompleteDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Upload Success!"),
        // TODO: Show results / Show all questions uploaded by user
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (UploadQuestionPage())),
              );
            },
            child: Text("Add more questions")),
        ElevatedButton(
            onPressed: () {},
            child: Text("Go Back to Home Page")), // ! Add a route to home page
        ElevatedButton(onPressed: () {
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => (ReadyQuizPage())),
              );
        }, child: Text("Take a quiz now!"))
      ],
    ));
  }
}
