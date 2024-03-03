// ignore_for_file: avoid_print
// import 'package:scholars_guide/features/quiz_mode/data/data_sources/remote_data_source/fetch_questions.dart';
// import 'package:scholars_guide/service_locator/service_locator.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scholars_guide/core/models/firestore_model.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_upload/domain/repositories_contract/quiz_upload_repository_contract.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input/quiz_input_cubit.dart';
import 'package:scholars_guide/firebase_options.dart';

class QuizUploadRepositoryImpl implements QuizUploadRepositoryContract {
  const QuizUploadRepositoryImpl();

  @override
  Future<bool> uploadQuestions(
      {required List<QuizInputCubit> questionsToUpload,
      required SUBJ subjToUpload}) async {
    late bool uploadSucess = true;

    await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform)
        .whenComplete(() {
      for (QuizInputCubit questionCubit in questionsToUpload) {
        Question question = Question(
            question: questionCubit.state.question,
            solution: questionCubit.state.solution,
            options: questionCubit.state.options,
            correctIndex: int.parse(questionCubit.state.answerIndex),
            subject: subjToUpload);

        FirebaseFirestore.instance
            .collection(FireStore.SUBJ2subject(subjToUpload))
            .add(question.toMap())
            .then((value) => print('Question added to the database'))
            .catchError((error) {
              print('Failed to add question: $error');
              uploadSucess = false;
            });
      }
    });

    return uploadSucess;
  }
}
