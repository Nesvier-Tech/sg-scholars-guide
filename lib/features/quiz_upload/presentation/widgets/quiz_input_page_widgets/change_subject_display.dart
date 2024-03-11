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
            ),
            DropdownButton<String>(
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Color.fromARGB(255, 63, 86, 169)), // ! Panget UI
              underline: Container(
                height: 2,
                color: Color.fromARGB(255, 63, 86, 169),
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
