import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quiz_card_event.dart';
part 'quiz_card_state.dart';

class QuizCardBloc extends Bloc<QuizCardEvent, QuizCardState> {
  QuizCardBloc() : super(QuizCardInitial()) {
    on<QuizCardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
