// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/domain/usecases/select_questions.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz/quiz_bloc.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/question_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/question_loading_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/timer_display.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.subject});

  final SUBJ subject;
  final int numQuestions = 10;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuizBloc>(
      create: (context) => QuizBloc()..add(QuizLoadQuestions(subject: widget.subject, numQuestions: widget.numQuestions)),
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (quizBlocContext, state) {
          if (state is QuizLoading) {
            print("TEST@222222");
            // QuizLoadQuestions(subject: widget.subject, numQuestions: widget.numQuestions);
            return QuestionLoadingDisplay();
          } else if (state is QuizOngoing) {
            return Column(
              children: [
                QuestionDisplay(),
                TimerDisplay(),
              ],
            );
          } else if (state is QuizFinish) {
            return SizedBox();
          } else if (state is QuizOutOfTime) {
            return SizedBox();
          } else if (state is QuizError) {
            return SizedBox();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
