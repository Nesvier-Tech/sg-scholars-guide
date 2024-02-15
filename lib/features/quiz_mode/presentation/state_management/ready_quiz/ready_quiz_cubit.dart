import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scholars_guide/core/models/question_model.dart';

part 'ready_quiz_state.dart';

class ReadyQuizCubit extends Cubit<ReadyQuizState> {
  ReadyQuizCubit() : super(ReadyQuizInitial());
  
  void chooseMath() => emit(const ReadyQuizSubjectChosen(subject: SUBJ.MATH));
  void chooseScience() => emit(const ReadyQuizSubjectChosen(subject: SUBJ.SCIENCE));
  void chooseReading() => emit(const ReadyQuizSubjectChosen(subject: SUBJ.READING));
  void chooseLanguage() => emit(const ReadyQuizSubjectChosen(subject: SUBJ.LANGUAGE));
  void chooseAll() => emit(const ReadyQuizSubjectChosen(subject: SUBJ.ALL));
  void chooseAgain() => emit(ReadyQuizInitial());
}
