// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input_page/quiz_input_page_bloc.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_page_widgets/add_or_submit_display.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_page_widgets/change_subject_display.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_widgets/question_input_display.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_widgets/question_preview_display.dart';

class UploadQuestionPage extends StatefulWidget {
  const UploadQuestionPage({super.key});

  @override
  State<UploadQuestionPage> createState() => _UploadQuestionPageState();
}

class _UploadQuestionPageState extends State<UploadQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: BlocProvider(
        create: (blocContext) => QuizInputPageBloc(),
        child: BlocBuilder<QuizInputPageBloc, QuizInputPageState>(
          builder: (blocBuilderContext, state) {
            if (state is QuizInputPageQuestionsAdd) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Upload Questions'),
                  bottom: TabBar(
                    tabs: const <Widget>[
                      Tab(
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.edit_outlined),
                            SizedBox(width: 8.0),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      Tab(
                        icon: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.preview_outlined),
                            SizedBox(width: 8.0),
                            Text('Preview'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ChangeSubjectDisplay(),
                          QuestionInputDisplay(),
                          AddOrSubmitDisplay(),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: QuestionPreviewDisplay(),
                    ),
                  ],
                ),
              );
            }
            return Text("Something went wrong! (state not found)");
          },
        ),
      ),
    );
  }
}
