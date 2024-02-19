import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';

import '../../state_management/ready_quiz/ready_quiz_cubit.dart';

class ChooseSubjectDisplay extends StatefulWidget {
  const ChooseSubjectDisplay({super.key});

  @override
  State<ChooseSubjectDisplay> createState() => _ChooseSubjectDisplayState();
}

class _ChooseSubjectDisplayState extends State<ChooseSubjectDisplay> {
  @override
  Widget build(BuildContext context) {
    return Portal(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "Choose a subject to start the quiz",
        style: TextStyle(fontSize: 20),
      ),
      // buildElevatedButton("UPCAT Challenge", context), // TODO: Implement UPCAT Challenge
      buildElevatedButton("Math", context),
      buildElevatedButton("Science", context),
      buildElevatedButton("Language Proficiency", context),
      buildElevatedButton("Reading Comprehension", context),
    ]));
  }
}

Container buildElevatedButton(String text, BuildContext context) {
  return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      height: 50,
      width: 220,
      child: ElevatedButton(
          onPressed: () {
            switch (text) {
              case "Math":
                context.read<ReadyQuizCubit>().chooseMath();
                break;
              case "Science":
                context.read<ReadyQuizCubit>().chooseScience();
                break;
              case "Language Proficiency":
                context.read<ReadyQuizCubit>().chooseLanguage();
                break;
              case "Reading Comprehension":
                context.read<ReadyQuizCubit>().chooseReading();
                break;
              case "UPCAT Challenge":
                // context.read<ReadyQuizCubit>().chooseAll();
                break;
              default:
                context.read<ReadyQuizCubit>().chooseAll();
            }
          },
          child: Text(text)));
}
