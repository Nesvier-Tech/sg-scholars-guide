// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/ready_quiz_page_widgets/choose_subject_display.dart';

class ReadyQuizPage extends StatelessWidget {
  const ReadyQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Quiz Mode',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Center(
          child: ChooseSubjectDisplay(),
        ));
  }
}
