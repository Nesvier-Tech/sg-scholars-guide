import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_page_widgets/confirm_submit_quiz_input_dialogue.dart';

import '../../state_management/quiz_input_page/quiz_input_page_bloc.dart';

class AddOrSubmitDisplay extends StatelessWidget {
  const AddOrSubmitDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                context
                    .read<QuizInputPageBloc>()
                    .add(QuizInputPageAddBtnPressed());
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: const Color.fromRGBO(128, 0, 0, 1),
                    ),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text("Add Question",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(128, 0, 0, 1))),
            ),
          ),
          Container(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                showDialog<AlertDialog>(
                    context: context,
                    builder: (BuildContext buildContext) {
                      return ConfirmSubmitQuizInputDialogue(
                          quizInputPageBloc: context.read<QuizInputPageBloc>());
                    });
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(128, 0, 0, 1)),
              ),
              child: Text("Submit Questions",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
