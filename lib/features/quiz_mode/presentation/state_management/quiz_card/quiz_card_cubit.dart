import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quiz_card_state.dart';

class QuizCardCubit extends Cubit<QuizCardState> {
  QuizCardCubit({
    required this.correctAnswerIndex,
    required this.optionsArray,
    required this.question,
    required this.isAnswered
  }) : super(QuizCardUnanswered());

  final int correctAnswerIndex;
  final List<String> optionsArray;
  final String question;
  final bool isAnswered;

  void chooseOptionA() => emit(const QuizCardAnswered(optionChosenIndex: 0));
  void chooseOptionB() => emit(const QuizCardAnswered(optionChosenIndex: 1));
  void chooseOptionC() => emit(const QuizCardAnswered(optionChosenIndex: 2));
  void chooseOptionD() => emit(const QuizCardAnswered(optionChosenIndex: 3));
  void revealAnswer()  => emit(QuizCardRevealed());
}
