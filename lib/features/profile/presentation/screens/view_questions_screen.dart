import 'package:flutter/material.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/profile/presentation/widgets/view_question_modal.dart';
import 'package:scholars_guide/features/quiz_mode/data/repositories/quiz_mode_repository_impl.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/question_loading_display.dart';

class ViewQuestionsScreen extends StatefulWidget {
  const ViewQuestionsScreen({super.key});

  @override
  State<ViewQuestionsScreen> createState() => _ViewQuestionsScreenState();
}

class _ViewQuestionsScreenState extends State<ViewQuestionsScreen> {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'My Questions',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(128, 0, 0, 1),
          ),
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back, color: Color.fromRGBO(128, 0, 0, 1)),
          onPressed: () {
            Navigator.of(buildContext).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: FutureBuilder(
          future: const QuizModeRepositoryImpl().collectMyQuestions(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Question>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const QuestionLoadingDisplay();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Question> questions = snapshot.data!;

              if (questions.isEmpty) {
                return const Center(
                  child: Text(
                    'No questions yet',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(128, 0, 0, 1),
                    ),
                  ),
                );
              }

              return ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Material(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          showDragHandle: true,
                          builder: (BuildContext context) => ViewQuestionModal(
                            question: questions[index],
                          ),
                        );
                      },
                      child: MyQuestionCard(questions: questions, index: index),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class MyQuestionCard extends StatelessWidget {
  const MyQuestionCard({
    super.key,
    required this.questions,
    required this.index,
  });

  final List<Question> questions;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 50, // Set the minimum height to your desired value
      ),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(8.0), // Adjust the corner radius here
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Add padding here
          child: Text(questions[index].question),
        ),
      ),
    );
  }
}
