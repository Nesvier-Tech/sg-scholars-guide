import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'finished_quiz_event.dart';
part 'finished_quiz_state.dart';

class FinishedQuizBloc extends Bloc<FinishedQuizEvent, FinishedQuizState> {
  FinishedQuizBloc() : super(FinishedQuizInitial()) {
    on<FinishedQuizEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
