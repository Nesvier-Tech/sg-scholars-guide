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
          ElevatedButton(
            onPressed: () {
              context
                  .read<QuizInputPageBloc>()
                  .add(QuizInputPageAddBtnPressed());
            },
            child: const Text('Add Question'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog<AlertDialog>(
                  context: context,
                  builder: (BuildContext buildContext) {
                    return ConfirmSubmitQuizInputDialogue(
                        quizInputPageBloc: context.read<QuizInputPageBloc>());
                  });
            },
            child: const Text('Submit Questions'),
          )
        ],
      ),
    );
  }
}
