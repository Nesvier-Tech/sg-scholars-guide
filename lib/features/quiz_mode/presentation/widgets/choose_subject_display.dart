import 'package:flutter/material.dart';

class ChooseSubjectDisplay extends StatefulWidget {
  const ChooseSubjectDisplay({super.key});

  @override
  State<ChooseSubjectDisplay> createState() => _ChooseSubjectDisplayState();
}

class _ChooseSubjectDisplayState extends State<ChooseSubjectDisplay> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "Choose a subject to start the quiz",
        style: TextStyle(fontSize: 20),
      ),
      buildElevatedButton("UPCAT Challenge"),
      buildElevatedButton("Math"),
      buildElevatedButton("Science"),
      buildElevatedButton("Language Proficiency"),
      buildElevatedButton("Reading Comprehension"),
    ]);
  }
}

Container buildElevatedButton(String text) {
  return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      height: 50,
      width: 220,
      child: ElevatedButton(onPressed: () {}, child: Text(text)));
}