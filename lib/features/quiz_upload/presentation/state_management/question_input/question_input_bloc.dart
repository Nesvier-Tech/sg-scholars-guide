import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'question_input_event.dart';
part 'question_input_state.dart';

class QuestionInputBloc extends Bloc<QuestionInputEvent, QuestionInputState> {
  QuestionInputBloc() : super(QuestionInputInitial()) {
    on<QuestionInputEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
