// ignore_for_file: avoid_print
// import 'package:scholars_guide/features/quiz_mode/data/data_sources/remote_data_source/fetch_questions.dart';
// import 'package:scholars_guide/service_locator/service_locator.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholars_guide/core/models/firestore_model.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/domain/repositories_contract/quiz_mode_repository_contract.dart';

import '../../../../service_locator/service_locator.dart';

class QuizModeRepositoryImpl implements QuizModeRepositoryContract {
  const QuizModeRepositoryImpl();

  @override
  Future<List<Question>> collectQuestions({required SUBJ subj}) async {
    final dbService = services<FirebaseFirestore>();
    List<Question> questions = [];

    await dbService
        .collection(FireStore.SUBJ2subject(subj))
        .get()
        .then((snapshot) {
      snapshot.docs
          .map((e) => questions.add(Question.fromMap(e.id, e.data(), subj)))
          .toList();
      for (var d in snapshot.docs) {
        print(d.id);
        print(d.data());
      }
    });

    return questions;
  }
}
