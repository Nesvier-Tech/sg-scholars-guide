part of 'quiz_card_cubit.dart';

sealed class QuizCardState extends Equatable {
  const QuizCardState();

  @override
  List<Object> get props => [];
}

final class QuizCardUnanswered extends QuizCardState {}

final class QuizCardAnswered extends QuizCardState {
  const QuizCardAnswered({required this.chosenIndex});

  final int chosenIndex;

  @override
  List<Object> get props => [chosenIndex];
}

final class QuizCardRevealed extends QuizCardState {
  const QuizCardRevealed({required this.chosenIndex});

  final int chosenIndex;

  @override
  List<Object> get props => [chosenIndex];
}
