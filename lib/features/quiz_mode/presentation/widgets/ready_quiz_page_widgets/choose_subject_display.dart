import 'package:flutter/material.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/ready_quiz_page_widgets/subject_chosen_dialogue.dart';

class ChooseSubjectDisplay extends StatefulWidget {
  const ChooseSubjectDisplay({super.key});

  @override
  State<ChooseSubjectDisplay> createState() => _ChooseSubjectDisplayState();
}

class _ChooseSubjectDisplayState extends State<ChooseSubjectDisplay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Choose a subject to start the quiz",
          style: TextStyle(fontSize: 20),
        ),
        // buildElevatedButton("UPCAT Challenge", context), // TODO: Implement UPCAT Challenge
        buildElevatedButton("Math", context),
        buildElevatedButton("Science", context),
        buildElevatedButton("Language Proficiency", context),
        buildElevatedButton("Reading Comprehension", context),
      ],
    );
  }
}

Container buildElevatedButton(String text, BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      height: 50,
      width: 220,
      child: ElevatedButton(
          onPressed: () {
            showDialog<AlertDialog>(
                context: context,
                builder: (BuildContext buildContext) {
                  return SubjectChosenDialogue(
                    subjectTest: text,
                  );
                });
          },
          child: Text(text)));
}
