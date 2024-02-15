import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quiz_navigation_event.dart';
part 'quiz_navigation_state.dart';

class QuizNavigationBloc extends Bloc<QuizNavigationEvent, QuizNavigationState> {
  QuizNavigationBloc() : super(QuizNavigationInitial()) {
    on<QuizNavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
