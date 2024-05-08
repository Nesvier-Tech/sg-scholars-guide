// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input/quiz_input_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/upload_quiz/upload_quiz_cubit.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/upload_quiz_widgets/upload_complete_display.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/upload_quiz_widgets/upload_loading_display.dart';

class UploadSuccessPage extends StatefulWidget {
  const UploadSuccessPage({super.key});

  @override
  State<UploadSuccessPage> createState() => _UploadSuccessPageState();
}

class _UploadSuccessPageState extends State<UploadSuccessPage> {
  @override
  Widget build(BuildContext buildContext) {
    final extraMap = GoRouterState.of(context).extra as Map<String, dynamic>;
    final List<QuizInputCubit> questionsToUpload =
        extraMap['questionsToUpload'] as List<QuizInputCubit>;
    final SUBJ subjToUpload = extraMap['subjToUpload'] as SUBJ;

    return BlocProvider<UploadQuizCubit>(
      create: (providerContext) =>
          UploadQuizCubit(questions: questionsToUpload, subj: subjToUpload)
            ..uploadQuiz(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(128, 0, 0, 1),
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text('Upload Questions',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
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
