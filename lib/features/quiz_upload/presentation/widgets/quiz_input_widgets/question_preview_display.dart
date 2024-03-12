import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input_page/quiz_input_page_bloc.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_widgets/question_preview_card_display.dart';

class QuestionPreviewDisplay extends StatelessWidget {
  const QuestionPreviewDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        context.read<QuizInputPageBloc>().questions.length,
        (index) {
          return QuestionPreviewCardDisplay(
            questionCubit: context.read<QuizInputPageBloc>().questions[index],
          );
        },
      ),
    );
  }
}