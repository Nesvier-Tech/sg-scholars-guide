part of 'solution_quiz_cubit.dart';

sealed class SolutionQuizState extends Equatable {
  const SolutionQuizState();

  @override
  List<Object> get props => [];
}

final class SolutionQuizLoad extends SolutionQuizState {}

final class SolutionQuizShown extends SolutionQuizState {}
