// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz/quiz_bloc.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/confirm_cancel_quiz_dialogue.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/confirm_submit_quiz_dialogue.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/question_loading_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/timer_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_widgets/question_display.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  final int numQuestions = 10; // ! For now, only 10 question

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    final subject = GoRouterState.of(context).extra as SUBJ;

    return BlocProvider<QuizBloc>(
      create: (context) => QuizBloc()
        ..add(
          QuizLoadQuestions(
            subject: subject,
            numQuestions: widget.numQuestions,
          ),
        ),
      child: Builder(
        builder: (builderContext) {
          return Scaffold(
            appBar: AppBar(
              title: Text('${Question.SUBJ2string(subject)} Quiz'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  showDialog<AlertDialog>(
                    context: context,
                    builder: (BuildContext buildContext) {
                      return ConfirmCancelQuizDialogue();
                    },
                  );
                },
              ),
            ),
            body: BlocBuilder<QuizBloc, QuizState>(
              builder: (quizBlocContext, state) {
                if (state is QuizLoading) {
                  return QuestionLoadingDisplay();
                } else if (state is QuizOngoing) {
                  return Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            // * Display the questions
                            QuestionDisplay(
                              subjectQuestionsMap: quizBlocContext
                                  .read<QuizBloc>()
                                  .subjectQuestionsMap,
                              subject: subject,
                            ),

                            // * Display the submit button
                            ElevatedButton(
                              onPressed: () {
                                showDialog<AlertDialog>(
                                  context: context,
                                  builder: (BuildContext buildContext) {
                                    return ConfirmSubmitQuizDialogue(
                                      quizBloc:
                                          quizBlocContext.read<QuizBloc>(),
                                    );
                                  },
                                );
                              },
                              child: Text("Submit"),
                            ),
                          ],
                        ),
                      ),

                      // * Display the timer
                      TimerDisplay(),
                    ],
                  );
                }

                GoRouter.of(context).go('/quiz-mode');
                return Text(
                    "SOMETHING WENT WRONG! (No Quiz Bloc State Matched)");
              },
            ),
          );
        },
      ),
    );
  }
}
