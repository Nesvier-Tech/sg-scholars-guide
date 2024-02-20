part of 'quiz_bloc.dart';

sealed class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

final class QuizLoading extends QuizState {}

final class QuizOngoing extends QuizState {}

final class QuizFinishConfirmation extends QuizState {}

final class QuizCancelConfirmation extends QuizState {}

final class QuizOutOfTime extends QuizState {}

final class QuizError extends QuizState {}
