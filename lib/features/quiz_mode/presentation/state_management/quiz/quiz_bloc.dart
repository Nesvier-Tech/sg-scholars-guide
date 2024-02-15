import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizLoading()) {    
    on<QuizFinishBtnPressed>((event, emit) {});
    on<QuizCancelBtnPressed>((event, emit) {});

    // * Only for quiz taking all subjects. 
    // TODO: Implement the logic for the next and previous page.
    on<QuizNextPageBtnPressed>((event, emit) {});
    on<QuizPreviousPageBtnPressed>((event, emit) {});
  }
}
