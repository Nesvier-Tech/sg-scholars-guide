
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quiz_input_state.dart';

class QuizInputCubit extends Cubit<QuizInputState> {
  QuizInputCubit()
      : super(const QuizInputState(
          question: '',
          options: ['', '', '', ''],
          answerIndex: '0',
          questionNonEmpty: false,
          optionsNonEmpty: [false, false, false, false],
        ));

  void questionChanged({required String question}) {
    // print("Question changed to $question");
    emit(state.copyWith(question: question));
  }

  void optionChanged({required List<String> options, required List<bool> optionsNonEmpty}) {
    // print("Options changed to $options");
    emit(state.copyWith(options: options, optionsNonEmpty: optionsNonEmpty));
  }

  void answerChanged({required String answerIndex}) {
    // print("Answer changed to $answerIndex");
    emit(state.copyWith(answerIndex: answerIndex));
  }
}
