// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/ready_quiz_page.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz/quiz_bloc.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/confirm_cancel_quiz_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/confirm_submit_quiz_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/confirm_timeout_quiz_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/question_loading_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/timer_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_widgets/question_display.dart';

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
    return BlocProvider<QuizBloc>(
        create: (context) => QuizBloc()
          ..add(QuizLoadQuestions(
              subject: widget.subject, numQuestions: widget.numQuestions)),
        child: Builder(builder: (builderContext) {
          return Scaffold(
              appBar: AppBar(
                  title: Text('${Question.SUBJ2string(widget.subject)} Quiz'),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      BlocProvider.of<QuizBloc>(builderContext)
                          .add(QuizCancelBtnPressed());
                    },
                  )),
              body: Center(child: BlocBuilder<QuizBloc, QuizState>(
                builder: (quizBlocContext, state) {
                  if (state is QuizLoading) {
                    return QuestionLoadingDisplay();
                  } else if (state is QuizOngoing) {
                    return Column(
                      children: [
                        // * Display the questions
                        QuestionDisplay(
                            subjectQuestionsMap: quizBlocContext
                                .read<QuizBloc>()
                                .subjectQuestionsMap,
                            subject: widget.subject),

                        // * Display the submit button
                        ElevatedButton(
                            onPressed: () {
                              quizBlocContext
                                  .read<QuizBloc>()
                                  .add(QuizFinishBtnPressed());
                            },
                            child: Text("Submit")),

                        // * Display the timer
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
              )));
        }));
  }
}
