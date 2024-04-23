// ignore_for_file: avoid_print
// import 'package:scholars_guide/features/quiz_mode/data/data_sources/remote_data_source/fetch_questions.dart';
// import 'package:scholars_guide/service_locator/service_locator.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scholars_guide/core/models/firestore_model.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/domain/repositories_contract/quiz_mode_repository_contract.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz/quiz_bloc.dart';

import '../../../../service_locator/service_locator.dart';

class QuizModeRepositoryImpl implements QuizModeRepositoryContract {
  const QuizModeRepositoryImpl();

  @override
  Future<List<Question>> collectQuestions({required SUBJ subj}) async {
    final dbService = services<FirebaseFirestore>();
    List<Question> questions = [];

    // * Fetching all questions of the chosen subject from the Firestore
    await dbService
        .collection(FireStore.SUBJ2subject(subj))
        .get()
        .then((snapshot) async {
      // * In case the question does not have a comment reference yet for old questions
      for (var e in snapshot.docs) {
        Map<String, dynamic> data = e.data();
        if (!data.containsKey(FireStore.commentRef)) {
          print("CREATING COMMENT REFERENCE TO: ${data[FireStore.question]}");
          // Uploading a comment section of this post to the database
          DocumentReference comRef =
              await dbService.collection(FireStore.commentsCollection).add({
            FireStore.commentArray: [],
          });
          // Updating the question reference with the comment reference
          e.reference.update({FireStore.commentRef: comRef});
        }
      }

      // * Mapping the fetched data to the Question model and adding it to the list
      snapshot.docs
          .map((e) => questions
              .add(Question.fromMap(id: e.id, data: e.data(), subject: subj)))
          .toList();
    });

    // * Fetching the solutions from the Firestore
    for (Question q in questions) {
      await q.solutionRef?.get().then((value) {
        q.solution = value[FireStore.solutionData];
      });
    }
    return questions;
  }

  @override
  Future<List> collectComments({required DocumentReference docRef}) async {
    List<Map> comments = [];

    await docRef.get().then((value) {
      value[FireStore.commentArray].forEach((element) {
        comments.add(element);
      });
    });

    return comments;
  }

  void addComment(
      {required DocumentReference docRef, required String comment}) async {
    final authService = services<FirebaseAuth>();
    final dbService = services<FirebaseFirestore>();

    final DocumentReference userRef = dbService
        .collection(FireStore.usersCollection)
        .doc(authService.currentUser?.uid);

    DocumentSnapshot userSnap = await userRef.get();
    Map<String, dynamic> userData = userSnap.data() as Map<String, dynamic>;

    docRef.update({
      FireStore.commentArray: FieldValue.arrayUnion([
        {
          FireStore.commentData: comment,
          FireStore.createdAt: Timestamp.now(),
          FireStore.createdBy: userRef,
          FireStore.commentInitials:
              userData[FireStore.username].substring(0, 2).toUpperCase(),
          FireStore.commentName: userData[FireStore.username],
        }
      ])
    });
  }

  Future<List<Question>> collectMyQuestions() async {
    final authService = services<FirebaseAuth>();
    final dbService = services<FirebaseFirestore>();

    final DocumentReference userRef = dbService
        .collection(FireStore.usersCollection)
        .doc(authService.currentUser?.uid);

    DocumentSnapshot userSnap = await userRef.get();
    Map<String, dynamic> userData = userSnap.data() as Map<String, dynamic>;

    // * In case the user does not have a posted questions field yet for old users
    if (!userData.containsKey(FireStore.postedQuestions)) {
      await userRef.update({FireStore.postedQuestions: []});
      return [];
    }

    // Fetching all questions reference in of the user using the user reference
    List<Question> questions = [];

    List<dynamic> postedQuestions = userData[FireStore.postedQuestions];
    for (DocumentReference e in postedQuestions) {
      DocumentSnapshot eSnap = await e.get();
      questions.add(Question.fromMap(
          id: eSnap.id,
          data: eSnap.data() as Map<String, dynamic>,
          subject: SUBJ.ALL,
          questionRef: e));
    }

    return questions;
  }

  void deleteQuestion({required DocumentReference docRef}) {
    final authService = services<FirebaseAuth>();
    final dbService = services<FirebaseFirestore>();

    final DocumentReference userRef = dbService
        .collection(FireStore.usersCollection)
        .doc(authService.currentUser?.uid);

    // * Removing the question reference from the user's posted questions
    userRef.update({
      FireStore.postedQuestions: FieldValue.arrayRemove([docRef])
    });

    // * Deleting the comment reference and solution reference of the question
    docRef.get().then((value) {
      DocumentReference comRef = value[FireStore.commentRef];
      DocumentReference solRef = value[FireStore.solutionRef];
      comRef.delete();
      solRef.delete();
      docRef.delete();
    });
  }
}
