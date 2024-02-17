import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/domain/usecases/select_questions.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizLoading()) {
    on<QuizLoadQuestions>((event, emit) async {
      await ChooseQuestions(subj: event.subject, numQuestions: event.numQuestions).choose();
      emit(QuizOngoing());
    });    
    on<QuizFinishBtnPressed>((event, emit) {});
    on<QuizCancelBtnPressed>((event, emit) {});

    // * Only for quiz taking all subjects. 
    // TODO: Implement the logic for the next and previous page.
    on<QuizNextPageBtnPressed>((event, emit) {});
    on<QuizPreviousPageBtnPressed>((event, emit) {});
  }
}
