import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'solution_quiz_state.dart';

class SolutionQuizCubit extends Cubit<SolutionQuizState> {
  SolutionQuizCubit() : super(SolutionQuizLoad());

  void loadSolutions() async {
    await placeholder();
    emit(SolutionQuizShown());
  }
}

Future<void> placeholder() async {
  await Future.delayed(Duration(seconds: 3));
}
