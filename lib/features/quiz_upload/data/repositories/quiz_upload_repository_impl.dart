// ignore_for_file: avoid_print
// import 'package:scholars_guide/features/quiz_mode/data/data_sources/remote_data_source/fetch_questions.dart';
// import 'package:scholars_guide/service_locator/service_locator.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scholars_guide/core/models/firestore_model.dart';
import 'package:scholars_guide/core/models/question_model.dart';

import 'package:scholars_guide/features/quiz_upload/domain/repositories_contract/quiz_upload_repository_contract.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input/quiz_input_cubit.dart';

import '../../../../service_locator/service_locator.dart';

class QuizUploadRepositoryImpl implements QuizUploadRepositoryContract {
  const QuizUploadRepositoryImpl();

  @override
  Future<void> uploadQuestions(
      {required List<QuizInputCubit> questionsToUpload,
      required SUBJ subjToUpload}) async {
    final authService = services<FirebaseAuth>();
    final dbService = services<FirebaseFirestore>();

    final DocumentReference userRef = dbService
        .collection(FireStore.usersCollection)
        .doc(authService.currentUser?.uid);

    late bool uploadSucess = true;

    // print('Username uid is: ${authService.currentUser?.uid}');

    for (QuizInputCubit questionCubit in questionsToUpload) {
      // * Uploading the solutions first to the database
      DocumentReference solRef =
          await dbService.collection(FireStore.solutionsCollection).add({
        FireStore.solutionData: questionCubit.solution,
        FireStore.createdBy: userRef,
        FireStore.createdAt: FieldValue.serverTimestamp(),
      });

      // * Uploading a comment section of this post to the database
      DocumentReference comRef =
          await dbService.collection(FireStore.commentsCollection).add({
        FireStore.commentArray: [],
      });

      // * Uploading the questions to the database w/ solutions reference
      Question question = Question(
          question: questionCubit.question,
          options: questionCubit.options,
          correctIndex: int.parse(questionCubit.answerIndex),
          subject: subjToUpload,
          solutionRef: solRef,
          commentRef: comRef,
          createdBy: userRef);

      DocumentReference questionRef = await dbService
          .collection(FireStore.SUBJ2subject(subjToUpload))
          .add(question.toMap());

      DocumentSnapshot userSnap = await userRef.get();
      Map<String, dynamic> userData = userSnap.data() as Map<String, dynamic>;

      // * In case the user does not have a posted questions field yet for old users
      if (!userData.containsKey(FireStore.postedQuestions)) {
        await userRef.update({FireStore.postedQuestions: []});
      }

      // * Uploading the question reference to the user's posted questions field
      await userRef.update({
        FireStore.postedQuestions: FieldValue.arrayUnion([questionRef])
      });
    }
  }
}
