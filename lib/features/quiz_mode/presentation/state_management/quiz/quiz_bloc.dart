// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz_card/quiz_card_cubit.dart';
import '../../../../../core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/domain/usecases/select_questions.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizLoading()) {
    on<QuizLoadQuestions>((event, emit) async {
      subject = event.subject;

      if (event.subject == SUBJ.ALL) {
        Map<SUBJ, List<Question>> allSubjectQuestions = await ChooseQuestions(
                subj: event.subject, numQuestions: event.numQuestions)
            .chooseAll();

        subjectQuestionsMap = allSubjectQuestions.map((key, value) {
          return MapEntry(
              key,
              value
                  .map((e) => QuizCardCubit(
                      correctIndex: e.correctIndex,
                      optionsArray: e.options,
                      question: e.question))
                  .toList());
        });
      } else {
        List<Question> subjectQuestions = await ChooseQuestions(
                subj: event.subject, numQuestions: event.numQuestions)
            .choose();

        subjectQuestionsMap = {
          event.subject: subjectQuestions
              .map((e) => QuizCardCubit(
                  correctIndex: e.correctIndex,
                  optionsArray: e.options,
                  question: e.question))
              .toList()
        };
      }

      emit(QuizOngoing());
    });

    // * Only for quiz taking all subjects.
    // TODO: Implement the logic for the next and previous page.
    // on<QuizNextPageBtnPressed>((event, emit) {});
    // on<QuizPreviousPageBtnPressed>((event, emit) {});
  }

  late SUBJ subject;
  late Map<SUBJ, List<QuizCardCubit>> subjectQuestionsMap;
}
