// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/domain/usecases/select_questions.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/pages/finished_quiz_page.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizLoading()) {
    on<QuizLoadQuestions>((event, emit) async {
      List<Question> totalQuestions = await ChooseQuestions(
              subj: event.subject, numQuestions: event.numQuestions)
          .choose();
      ongoingQuiz = QuizOngoing(totalQuestions);
      emit(ongoingQuiz);
    });

    // * For submitting the quiz
    on<QuizFinishBtnPressed>((event, emit) {
      print("Submit button pressed 2 =========================="); // ! Debugging
      emit(QuizFinishConfirmation());
    });
    on<QuizConfirmFinishBtnPressed>((event, emit) {
      emit(ongoingQuiz);
    });
    on<QuizTimeFinished>((event, emit) {
      emit(QuizOutOfTime());
    });

    // * For cancelling the quiz
    on<QuizCancelBtnPressed>((event, emit) {
      emit(QuizCancelConfirmation());
    });
    on<QuizConfirmCancelBtnPressed>((event, emit) {
      emit(ongoingQuiz);
    });

    // * Only for quiz taking all subjects.
    // TODO: Implement the logic for the next and previous page.
    on<QuizNextPageBtnPressed>((event, emit) {});
    on<QuizPreviousPageBtnPressed>((event, emit) {});
  }

  late QuizOngoing ongoingQuiz;
}


      // Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => const FinishedQuizPage(),
      //       ))