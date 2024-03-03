
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quiz_input_state.dart';

class QuizInputCubit extends Cubit<QuizInputState> {
  QuizInputCubit()
      : super(const QuizInputState(
          question: '',
          solution: '',
          options: ['', '', '', ''],
          answerIndex: '0',
          questionNonEmpty: false,
          solutionNonEmpty: false,
          optionsNonEmpty: [false, false, false, false],
        ));

  void questionChanged({required String question}) {
    emit(state.copyWith(question: question));
  }

  void solutionChanged({required String solution}) {
    emit(state.copyWith(solution: solution));
  }

  void optionChanged({required List<String> options, required List<bool> optionsNonEmpty}) {
    emit(state.copyWith(options: options, optionsNonEmpty: optionsNonEmpty));
  }

  void answerChanged({required String answerIndex}) {
    emit(state.copyWith(answerIndex: answerIndex));
  }
}
