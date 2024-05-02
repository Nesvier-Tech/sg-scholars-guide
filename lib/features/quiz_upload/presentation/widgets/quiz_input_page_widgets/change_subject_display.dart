// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input_page/quiz_input_page_bloc.dart';

class ChangeSubjectDisplay extends StatefulWidget {
  const ChangeSubjectDisplay({super.key});

  @override
  State<ChangeSubjectDisplay> createState() => _ChangeSubjectDisplayState();
}

class _ChangeSubjectDisplayState extends State<ChangeSubjectDisplay> {
  List<String> subjects = SUBJ.values
      .where((e) => e != SUBJ.ALL)
      .map((e) => Question.SUBJ2string(e))
      .toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 500,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Subject: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            DropdownButton<String>(
              alignment: Alignment.center,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Color.fromRGBO(207, 0, 15, 1),
              ),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Color.fromRGBO(207, 0, 15, 1)),
              underline: Container(
                height: 2,
                color: Color.fromRGBO(207, 0, 15, 1),
              ),
              value: Question.SUBJ2string(
                  context.read<QuizInputPageBloc>().subject),
              onChanged: (newValue) {
                context.read<QuizInputPageBloc>().add(
                    QuizInputPageChangedSubject(
                        Question.string2SUBJ(newValue as String)));
              },
              items: subjects.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
