import 'package:flutter/material.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/profile/presentation/widgets/view_question_modal.dart';
import 'package:scholars_guide/features/quiz_mode/domain/usecases/select_questions.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/question_loading_display.dart';

class ViewAllQuestionsScreen extends StatefulWidget {
  const ViewAllQuestionsScreen({super.key});

  @override
  State<ViewAllQuestionsScreen> createState() => _ViewAllQuestionsScreenState();
}

class _ViewAllQuestionsScreenState extends State<ViewAllQuestionsScreen> {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'All Questions',
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
          future: ChooseQuestions(subj: SUBJ.ALL, numQuestions: 0).chooseAll(),
          builder: (BuildContext context,
              AsyncSnapshot<Map<SUBJ, List<Question>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const QuestionLoadingDisplay();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              Map<SUBJ, List<Question>> questionsMap = snapshot.data!;
              if (questionsMap.isEmpty) {
                return const Center(
                  child: Text(
                    'No questions posted yet',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    for (SUBJ subj in questionsMap.keys
                        .where((subj) => subj != SUBJ.ALL)
                        .toList())
                      AllQuestionsSubjectDisplay(
                          subj: subj, questionsMap: questionsMap),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class AllQuestionsSubjectDisplay extends StatelessWidget {
  const AllQuestionsSubjectDisplay({
    super.key,
    required this.subj,
    required this.questionsMap,
  });

  final SUBJ subj;
  final Map<SUBJ, List<Question>> questionsMap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            Question.SUBJ2string(subj),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromRGBO(128, 0, 0, 1),
            ),
          ),
        ),
        Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromRGBO(
                    128, 0, 0, 1), // Set your desired color here
                width: 2.0, // Set your desired width here
              ),
            ),
            child: ListView.builder(
              itemCount: questionsMap[subj]?.length,
              itemBuilder: (context, index) {
                return Material(
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        builder: (BuildContext context) => ViewQuestionModal(
                          question: questionsMap[subj]![index],
                        ),
                      );
                    },
                    child: MyQuestionCard(
                        questions: questionsMap[subj]!, index: index),
                  ),
                );
              },
            )),
      ],
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
