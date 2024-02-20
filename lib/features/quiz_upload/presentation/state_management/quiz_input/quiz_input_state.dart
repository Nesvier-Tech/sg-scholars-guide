part of 'quiz_input_cubit.dart';

class QuizInputState extends Equatable {
  const QuizInputState({
    required this.question,
    required this.options,
    required this.answerIndex,
    required this.questionNonEmpty,
    required this.optionsNonEmpty,
  });

  final String question;
  final List<String> options;
  final String answerIndex;

  // Empty checker
  final bool questionNonEmpty;
  final List<bool> optionsNonEmpty;

  @override
  List<Object> get props => [question, options, answerIndex];

  QuizInputState copyWith({
    String? question,
    List<String>? options,
    String? answerIndex,
    bool? questionNonEmpty,
    List<bool>? optionsNonEmpty,
  }) {
    return QuizInputState(
      question: question ?? this.question,
      options: options ?? this.options,
      answerIndex: answerIndex ?? this.answerIndex,
      questionNonEmpty: question?.isNotEmpty ?? this.questionNonEmpty,
      optionsNonEmpty:
          options?.map((e) => e.isNotEmpty).toList() ?? this.optionsNonEmpty,
    );
  }
}
