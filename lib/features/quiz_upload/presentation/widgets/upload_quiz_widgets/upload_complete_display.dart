// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UploadCompleteDisplay extends StatelessWidget {
  UploadCompleteDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Upload Success!"),
        
        // Todo: Show results / Show all questions uploaded by user

        ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/quiz-upload');
            },
            child: Text("Add more questions")),
        // ElevatedButton(
        //     onPressed: () {},
        //     child: Text("Go Back to Home Page")), // ! Add a route to home page
        ElevatedButton(onPressed: () {
          GoRouter.of(context).go('/quiz-mode');
        }, child: Text("Take a quiz now!"))
      ],
    ));
  }
}
