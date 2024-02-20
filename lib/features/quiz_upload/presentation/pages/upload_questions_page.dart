// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input_page/quiz_input_page_bloc.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_page_widgets/add_or_submit_display.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_page_widgets/change_subject_display.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_page_widgets/confirm_cancel_quiz_input_display.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_page_widgets/confirm_submit_quiz_input_display.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_widgets/question_input_display.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadQuestionPage extends StatefulWidget {
  const UploadQuestionPage({super.key});

  @override
  State<UploadQuestionPage> createState() => _UploadQuestionPageState();
}

class _UploadQuestionPageState extends State<UploadQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (blocContext) => QuizInputPageBloc(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Upload Questions'),
            ),
            body: BlocBuilder<QuizInputPageBloc, QuizInputPageState>(
              builder: (blocBuilderContext, state) {
                if (state is QuizInputPageQuestionsAdd) {
                  return Center(
                      // Possible use ListView to have a scrollable navigation
                      child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                      ),
                      ChangeSubjectDisplay(),
                      QuestionInputDisplay(),
                      AddOrSubmitDisplay(),
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                      ),
                    ],
                  ));
                } else if (state is QuizInputPageConfirmSubmit) {
                  return ConfirmSubmitQuizInputDisplay();
                } else if (state is QuizInputPageConfirmCancel) {
                  return ConfirmCancelQuizInputDisplay();
                }

                return Text("Something went wrong! (state not found)");
              },
            )),
      ),
    );
  }
}
