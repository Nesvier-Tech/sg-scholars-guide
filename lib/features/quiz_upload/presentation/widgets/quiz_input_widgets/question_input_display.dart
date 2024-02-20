// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input/quiz_input_cubit.dart';
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
    return Expanded(
      child: ListView.builder(
        itemCount: buildContext.read<QuizInputPageBloc>().questions.length,
        itemBuilder: (listViewBuilderContext, index) {
          return Center(
            child: Dismissible(
              background: Container(
                width: 50.0,
                height: 50.0,
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20.0),
                margin: EdgeInsets.only(bottom: 10.0),
                child: Icon(Icons.delete),
              ),
              direction: DismissDirection.endToStart,
              key: ValueKey<int>(index),
              child: BlocBuilder<QuizInputCubit, QuizInputState>(
                bloc: buildContext.read<QuizInputPageBloc>().questions[index],
                builder: (context, state) {
                  return QuestionInputCard(
                      questionCubit: buildContext
                          .read<QuizInputPageBloc>()
                          .questions[index]);
                },
              ),
              onDismissed: (_) {
                buildContext.read<QuizInputPageBloc>().add(
                    QuizInputPageDeleteBtnPressed(
                        questionCubit: buildContext
                            .read<QuizInputPageBloc>()
                            .questions[index]));
              },
            ),
          );
        },
      ),
    );
  }
}
