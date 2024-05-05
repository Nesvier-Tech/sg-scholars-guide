import 'package:flutter/material.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/data/repositories/quiz_mode_repository_impl.dart';

class ViewQuestionModal extends StatelessWidget {
  const ViewQuestionModal({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Text("Question: ${question.question}"),
          Text("Choices: ${question.options}"),
          Text("Answer: ${question.correctIndex}"),
          Text("Created At: ${question.createdAt.toDate()}"),
          const Expanded(
            child: SizedBox(),
          ),
          FilledButton(
            onPressed: () {
              print("Deleting question: ${question.questionRef}");
              const QuizModeRepositoryImpl()
                  .deleteQuestion(docRef: question.questionRef!);
              Navigator.of(context).pop();
              Navigator.of(context).pop();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Question deleted'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text("Delete"),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
