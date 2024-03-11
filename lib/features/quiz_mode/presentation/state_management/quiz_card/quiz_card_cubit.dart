import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quiz_card_state.dart';

class QuizCardCubit extends Cubit<QuizCardState> {
  QuizCardCubit({
    required this.correctIndex,
    required this.optionsArray,
    required this.question,
    required this.solution,
  }) : super(QuizCardUnanswered());

  final int correctIndex;
  final List<String> optionsArray;
  final String question;
  final String solution;

  void chooseOption({required int index}) {
    emit(QuizCardUnanswered());
    emit(QuizCardAnswered(chosenIndex: index));
  }

  void revealAnswer({required int index}) =>
      emit(QuizCardRevealed(chosenIndex: index));
}
