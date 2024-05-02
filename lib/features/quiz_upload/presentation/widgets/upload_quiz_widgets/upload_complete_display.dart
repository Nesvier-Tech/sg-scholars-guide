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
        Text(
          "Upload Success!",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(207, 0, 15, 1),
            fontWeight: FontWeight.bold,
          ),
        ),

        // Todo: Show results / Show all questions uploaded by user
        Container(
          width: 180,
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/quiz-upload');
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(207, 0, 15, 1)),
            ),
            child: Text("Add more questions",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
        Container(
          width: 180,
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/quiz-mode');
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(207, 0, 15, 1)),
            ),
            child: Text("Take a quiz now!",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ],
    ));
  }
}
