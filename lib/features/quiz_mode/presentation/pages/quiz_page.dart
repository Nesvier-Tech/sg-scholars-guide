// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/domain/usecases/select_questions.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/finished_quiz_page.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/ready_quiz_page.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz/quiz_bloc.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/choose_subject_confirm_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/confirm_cancel_quiz_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/confirm_submit_quiz_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/confirm_timeout_quiz_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/question_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/question_loading_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/timer_display.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.subject});

  final SUBJ subject;
  final int numQuestions = 10; // ! For now, only 10 question

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
        ),
        body: Center(
          child: BlocProvider<QuizBloc>(
            create: (context) => QuizBloc()
              ..add(QuizLoadQuestions(
                  subject: widget.subject, numQuestions: widget.numQuestions)),
            child: BlocBuilder<QuizBloc, QuizState>(
              builder: (quizBlocContext, state) {
                if (state is QuizLoading) {
                  return QuestionLoadingDisplay();
                } else if (state is QuizOngoing) {
                  return Column(
                    children: [
                      QuestionDisplay(questions: state.questions),
                      ElevatedButton(
                          onPressed: () {
                            quizBlocContext
                                .read<QuizBloc>()
                                .add(QuizFinishBtnPressed());
                          },
                          child: Text("Submit")),
                      TimerDisplay(),
                    ],
                  );
                } else if (state is QuizFinishConfirmation) {
                  return ConfirmSubmitQuizDisplay();
                } else if (state is QuizCancelConfirmation) {
                  return ConfirmCancelQuizDisplay();
                } else if (state is QuizOutOfTime) {
                  return (ConfirmTimeOutQuizDisplay());
                } else if (state is QuizError) {
                  return ReadyQuizPage();
                }
                return Text(
                    "SOMETHING WENT WRONG! (No Quiz Bloc State Matched)");
              },
            ),
          ),
        ));
  }
}
