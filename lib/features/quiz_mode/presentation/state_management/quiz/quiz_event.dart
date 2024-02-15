part of 'quiz_bloc.dart';

sealed class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class QuizNextPageBtnPressed extends QuizEvent {}

class QuizPreviousPageBtnPressed extends QuizEvent {}

class QuizFinishBtnPressed extends QuizEvent {}

class QuizCancelBtnPressed extends QuizEvent {}
