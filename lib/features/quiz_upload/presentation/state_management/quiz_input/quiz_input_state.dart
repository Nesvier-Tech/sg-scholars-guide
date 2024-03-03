part of 'quiz_input_cubit.dart';

class QuizInputState extends Equatable {
  const QuizInputState({
    required this.question,
    required this.solution,
    required this.options,
    required this.answerIndex,
    required this.questionNonEmpty,
    required this.solutionNonEmpty,
    required this.optionsNonEmpty,
  });

  final String question;
  final String solution;
  final List<String> options;
  final String answerIndex;

  // Empty checker
  final bool questionNonEmpty;
  final bool solutionNonEmpty;
  final List<bool> optionsNonEmpty;

  @override
  List<Object> get props => [question, solution, options, answerIndex, questionNonEmpty, solutionNonEmpty, optionsNonEmpty];

  QuizInputState copyWith({
    String? question,
    String? solution,
    List<String>? options,
    String? answerIndex,
    bool? questionNonEmpty,
    bool? solutionNonEmpty,
    List<bool>? optionsNonEmpty,
  }) {
    return QuizInputState(
      question: question ?? this.question,
      solution: solution ?? this.solution,
      options: options ?? this.options,
      answerIndex: answerIndex ?? this.answerIndex,
      questionNonEmpty: question?.isNotEmpty ?? this.questionNonEmpty,
      solutionNonEmpty: solution?.isNotEmpty ?? this.solutionNonEmpty,
      optionsNonEmpty:
          options?.map((e) => e.isNotEmpty).toList() ?? this.optionsNonEmpty,
    );
  }
}
