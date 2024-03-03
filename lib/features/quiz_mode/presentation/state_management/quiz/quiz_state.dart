part of 'quiz_bloc.dart';

sealed class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

final class QuizLoading extends QuizState {}

final class QuizOngoing extends QuizState {}

final class QuizError extends QuizState {}
