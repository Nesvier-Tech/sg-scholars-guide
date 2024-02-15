part of 'ready_quiz_cubit.dart';

sealed class ReadyQuizState extends Equatable {
  const ReadyQuizState();

  @override
  List<Object> get props => [];
}

// Initial state shows 5 options in the ready quiz page.
class ReadyQuizInitial extends ReadyQuizState {}

// Once the user chooses a subject, the state changes to ReadyQuizSubjectChosen.
// User will choose to confirm or not.
class ReadyQuizSubjectChosen extends ReadyQuizState {
  const ReadyQuizSubjectChosen({required this.subject});

  final SUBJ subject;

  @override
  List<Object> get props => [subject];
}
