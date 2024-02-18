part of 'quiz_bloc.dart';

sealed class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class QuizLoadQuestions extends QuizEvent {
  const QuizLoadQuestions({required this.subject, required this.numQuestions});

  final SUBJ subject;
  final int numQuestions;

  @override
  List<Object> get props => [subject, numQuestions];
}

class QuizFinishBtnPressed extends QuizEvent {}

class QuizConfirmFinishBtnPressed extends QuizEvent {}

class QuizCancelBtnPressed extends QuizEvent {}

class QuizConfirmCancelBtnPressed extends QuizEvent {}

class QuizTimeFinished extends QuizEvent {}

class QuizNextPageBtnPressed extends QuizEvent {}

class QuizPreviousPageBtnPressed extends QuizEvent {}
