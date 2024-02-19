part of 'quiz_input_page_bloc.dart';

sealed class QuizInputPageState extends Equatable {
  const QuizInputPageState();
  
  @override
  List<Object> get props => [];
}

class QuizInputPageRefresh extends QuizInputPageState {}

class QuizInputPageQuestionsAdd extends QuizInputPageState {}

class QuizInputPageConfirmSubmit extends QuizInputPageState {}

class QuizInputPageConfirmCancel extends QuizInputPageState {}