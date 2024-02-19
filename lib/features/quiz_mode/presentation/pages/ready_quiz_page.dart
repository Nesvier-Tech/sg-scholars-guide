// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/ready_quiz_page_widgets/choose_subject_confirm_display.dart';

import '../state_management/ready_quiz/ready_quiz_cubit.dart';
import '../widgets/ready_quiz_page_widgets/choose_subject_display.dart';

class ReadyQuizPage extends StatelessWidget {
  const ReadyQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Submit Questions'),
        ),
        body: Center(
          child: BlocProvider<ReadyQuizCubit>(
              create: (context) => ReadyQuizCubit(),
              child: BlocBuilder<ReadyQuizCubit, ReadyQuizState>(
                  builder: (readyQuizCubitContext, state) {
                if (state is ReadyQuizSubjectChosen) {
                  return ChooseSubjectConfirmDisplay(subject: state.subject);
                }
                return ChooseSubjectDisplay();
              })),
        ));
  }
}
