// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChangeSubjectDisplay extends StatefulWidget {
  const ChangeSubjectDisplay({super.key});

  @override
  State<ChangeSubjectDisplay> createState() => _ChangeSubjectDisplayState();
}

class _ChangeSubjectDisplayState extends State<ChangeSubjectDisplay> {
  String dropdownValue = 'Mathematics';
  List<String> subjects = [
    'Mathematics',
    'Science',
    'Reading Comprehension',
    'Language Proficiency',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:500,
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
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              value: dropdownValue,
              onChanged: (newValue) {
                setState(() {
                  dropdownValue = newValue as String;
                });
              },
              items: subjects.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
      ],)
    );
  }
}