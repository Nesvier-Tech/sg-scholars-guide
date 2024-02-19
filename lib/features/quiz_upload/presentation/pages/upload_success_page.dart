// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input/quiz_input_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/upload_quiz/upload_quiz_cubit.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/upload_quiz_widgets/upload_complete_display.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/upload_quiz_widgets/upload_loading_display.dart';

class UploadSuccessPage extends StatefulWidget {
  const UploadSuccessPage(
      {super.key, required this.questionsToUpload, required this.subjToUpload});

  final List<QuizInputCubit> questionsToUpload;
  final SUBJ subjToUpload;

  @override
  State<UploadSuccessPage> createState() => _UploadSuccessPageState();
}

class _UploadSuccessPageState extends State<UploadSuccessPage> {
  @override
  Widget build(BuildContext buildContext) {
    return BlocProvider<UploadQuizCubit>(
      create: (providerContext) => UploadQuizCubit(
          questions: widget.questionsToUpload, subj: widget.subjToUpload)
        ..uploadQuiz(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload Questions'),
        ),
        body: BlocBuilder<UploadQuizCubit, UploadQuizState>(
          builder: (blocBuilderContext, state) {
            if (state is UploadQuizLoading) {
              return UploadLoadingDisplay();
            } else if (state is UploadQuizLoaded) {
              return UploadCompleteDisplay();
            }
            return Text("Something went wrong!");
          },
        ),
      ),
    );
  }
}
