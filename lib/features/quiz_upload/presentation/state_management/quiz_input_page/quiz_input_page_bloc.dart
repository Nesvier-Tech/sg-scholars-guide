// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input/quiz_input_cubit.dart';

part 'quiz_input_page_event.dart';
part 'quiz_input_page_state.dart';

class QuizInputPageBloc extends Bloc<QuizInputPageEvent, QuizInputPageState> {
  QuizInputPageBloc() : super(QuizInputPageQuestionsAdd()) {
    // * For changing the subject
    on<QuizInputPageChangedSubject>((event, emit) {
      print("Changed subject to ${event.subject}");
      subject = event.subject;
      emit(QuizInputPageRefresh());
      emit(QuizInputPageQuestionsAdd());
    });

    // * For submitting the quiz upload
    on<QuizInputPageSubmitBtnPressed>((event, emit) {
      _printQuestions();

      if (_questionsNotEmpty() && questions.isNotEmpty) {
        revealBlanks = false;
        emit(QuizInputPageConfirmSubmit());
      } else {
        revealBlanks = true;
        emit(QuizInputPageRefresh());
        emit(QuizInputPageQuestionsAdd());
      }
    });
    on<QuizInputPageCancelSubmitBtnPressed>((event, emit) {
      emit(QuizInputPageQuestionsAdd());
    });

    // * For cancelling the quiz upload
    on<QuizInputPageBackBtnPressed>((event, emit) {
      emit(QuizInputPageConfirmCancel());
    });
    on<QuizInputPageCancelBackBtnPressed>((event, emit) {
      emit(QuizInputPageQuestionsAdd());
    });

    // * For adding and deleting questions
    on<QuizInputPageAddBtnPressed>((event, emit) {
      questions.add(QuizInputCubit());
      emit(QuizInputPageRefresh());
      emit(QuizInputPageQuestionsAdd());
    });
    on<QuizInputPageDeleteBtnPressed>((event, emit) {
      questions.remove(event.questionCubit);
      emit(QuizInputPageRefresh());
      emit(QuizInputPageQuestionsAdd());
    });
  }

  List<QuizInputCubit> questions = [QuizInputCubit()];
  SUBJ subject = SUBJ.MATH;
  bool revealBlanks = false;

  bool _questionsNotEmpty() {
    for (var question in questions) {
      if (!question.state.questionNonEmpty) return false;
      for (var option in question.state.optionsNonEmpty) {
        if (!option) return false;
      }
    }
    return true;
  }

  void _printQuestions() {
    print("REVEAL THE BLANKS ? $revealBlanks");
    for (var question in questions) {
      print(
          " ====================================== Printing question ======================================");
      print("Question: ${question.state.question}");
      print("Options: ${question.state.options}");
      print("Answer: ${question.state.answerIndex}");
      print("Question non empty: ${question.state.questionNonEmpty}");
      print("Options non empty: ${question.state.optionsNonEmpty}");
    }
  }
}
