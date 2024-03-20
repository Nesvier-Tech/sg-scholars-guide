import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quiz_input_state.dart';

class QuizInputCubit extends Cubit<QuizInputState> {
  QuizInputCubit() : super(const QuizInputState());

  void refresh() {
    emit(QuizInputRefresh());
    emit(const QuizInputState());
  }

  String question = '';
  String solution = '';
  List<String> options = ['', '', '', ''];
  String answerIndex = '0';
  bool questionNonEmpty = false;
  bool solutionNonEmpty = false;
  List<bool> optionsNonEmpty = [false, false, false, false];
}
