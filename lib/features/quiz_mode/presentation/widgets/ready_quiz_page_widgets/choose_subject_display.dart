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
          "Choose a subject",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        // buildElevatedButton("UPCAT Challenge", context), // TODO: Implement UPCAT Challenge
        buildElevatedButton("Mathematics",
            "assets/logos/sg_sholars_guide_math_icon.png", 28, context),
        buildElevatedButton("Science",
            "assets/logos/sg_sholars_guide_science_icon.png", 28, context),
        buildElevatedButton("Language Proficiency",
            "assets/logos/sg_sholars_guide_language_icon.png", 36, context),
        buildElevatedButton("Reading Comprehension",
            "assets/logos/sg_sholars_guide_reading_icon.png", 33, context),
        const SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logos/sg_scholars_guide_logo-transformed-960x960.png",
              height: 50,
              width: 50,
            ),
            const Text(
              "Scholar's Guide",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
  }
}

Container buildElevatedButton(
    String text, String path, double length, BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 10),
      height: 50,
      width: 250,
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
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(3),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  14.0,
                ), // Set your desired corner radius here
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              const Color.fromRGBO(128, 0, 0, 1),
            ),
          ),
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Container(),
              ),
              Image.asset(
                path,
                height: length,
                width: length,
              )
            ],
          )));
}
