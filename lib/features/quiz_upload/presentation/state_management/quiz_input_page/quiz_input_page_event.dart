part of 'quiz_input_page_bloc.dart';

sealed class QuizInputPageEvent extends Equatable {
  const QuizInputPageEvent();

  @override
  List<Object> get props => [];
}

class QuizInputPageChangedSubject extends QuizInputPageEvent {
  const QuizInputPageChangedSubject(this.subject);
  final SUBJ subject;

  @override
  List<Object> get props => [subject];
}

class QuizInputPageSubmitBtnPressed extends QuizInputPageEvent {}
class QuizInputPageCancelSubmitBtnPressed extends QuizInputPageEvent {}

class QuizInputPageBackBtnPressed extends QuizInputPageEvent {}
class QuizInputPageCancelBackBtnPressed extends QuizInputPageEvent {}

class QuizInputPageAddBtnPressed extends QuizInputPageEvent {}

class QuizInputPageDeleteBtnPressed extends QuizInputPageEvent {
  const QuizInputPageDeleteBtnPressed({required this.questionCubit});
  final QuizInputCubit questionCubit;

  @override
  List<Object> get props => [questionCubit];
}
