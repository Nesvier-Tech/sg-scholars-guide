import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state_management/quiz_input_page/quiz_input_page_bloc.dart';

class AddOrSubmitDisplay extends StatelessWidget {
  const AddOrSubmitDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<QuizInputPageBloc>().add(QuizInputPageAddBtnPressed());
          },
          child: const Text('Add Question'),
        ),
        ElevatedButton(
          onPressed: () {
            context
                .read<QuizInputPageBloc>()
                .add(QuizInputPageSubmitBtnPressed());
          },
          child: const Text('Submit Questions'),
        )
      ],
    );
  }
}
