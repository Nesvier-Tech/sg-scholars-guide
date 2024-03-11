// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input_page/quiz_input_page_bloc.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_widgets/question_input_card_display.dart';

// Holds multiple question input cards
class QuestionInputDisplay extends StatefulWidget {
  const QuestionInputDisplay({super.key});

  @override
  State<QuestionInputDisplay> createState() => _QuestionInputDisplayState();
}

class _QuestionInputDisplayState extends State<QuestionInputDisplay> {
  @override
  Widget build(BuildContext buildContext) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(5.0),
      shrinkWrap: true,
      itemCount: buildContext.read<QuizInputPageBloc>().questions.length,
      itemBuilder: (_, index) {
        return Dismissible(
          background: Container(
            color: Colors.white,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20.0),
            margin: EdgeInsets.only(bottom: 10.0),
            child: Icon(Icons.delete),
          ),
          direction: DismissDirection.endToStart,
          key: ValueKey<int>(index),
          child: QuestionInputCard(
              questionCubit:
                  buildContext.read<QuizInputPageBloc>().questions[index]),
          onDismissed: (_) {
            buildContext.read<QuizInputPageBloc>().add(
                  QuizInputPageDeleteBtnPressed(
                    questionCubit:
                        buildContext.read<QuizInputPageBloc>().questions[index],
                  ),
                );
          },
        );
      },
    );
  }
}
