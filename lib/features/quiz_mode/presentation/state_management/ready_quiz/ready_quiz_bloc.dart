import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ready_quiz_event.dart';
part 'ready_quiz_state.dart';

class ReadyQuizBloc extends Bloc<ReadyQuizEvent, ReadyQuizState> {
  ReadyQuizBloc() : super(ReadyQuizInitial()) {
    on<ReadyQuizEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
