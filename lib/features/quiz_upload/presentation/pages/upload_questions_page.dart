// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/add_or_submit_display.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/change_subject_display.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/question_input_display.dart';

class UploadQuestionPage extends StatefulWidget {
  const UploadQuestionPage({super.key});

  @override
  State<UploadQuestionPage> createState() => _UploadQuestionPageState();
}

class _UploadQuestionPageState extends State<UploadQuestionPage> {
  

  @override
  Widget build(BuildContext context) {
    return Center(
        // Possible use ListView to have a scrollable navigation
        child: Column(
          children: [
            Container(margin: EdgeInsets.only(top: 10.0),),
            ChangeSubjectDisplay(),
            QuestionInputDisplay(),
            AddOrSubmitDisplay(),
            Container(margin: EdgeInsets.only(bottom: 20.0),),
          ],
        )
      );
  }
}
