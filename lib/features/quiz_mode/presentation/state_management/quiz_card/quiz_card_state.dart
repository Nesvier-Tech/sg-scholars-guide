part of 'quiz_card_cubit.dart';

sealed class QuizCardState extends Equatable {
  const QuizCardState();

  @override
  List<Object> get props => [];
}

final class QuizCardUnanswered extends QuizCardState {}

final class QuizCardAnswered extends QuizCardState {
  const QuizCardAnswered({required this.optionChosenIndex});

  final int optionChosenIndex;
}

final class QuizCardRevealed extends QuizCardState {}
