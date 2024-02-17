// ignore_for_file: avoid_print
// import 'package:scholars_guide/features/quiz_mode/data/data_sources/remote_data_source/fetch_questions.dart';
// import 'package:scholars_guide/service_locator/service_locator.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/domain/repositories_contract/quiz_mode_repository_contract.dart';
import 'package:scholars_guide/firebase_options.dart';

class QuizModeRepositoryImpl implements QuizModeRepositoryContract{
  const QuizModeRepositoryImpl();
  
  @override
  Future<List<Question>> collectQuestions({required SUBJ subj}) async {
    List<Question> questions = [];

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .whenComplete(() => FirebaseFirestore.instance
          .collection(Question.SUBJ2subject(subj))
          .get()
          .then((snapshot) => snapshot.docs
              .map((e) => questions.add(Question.fromMap(e.data())))
              .toList()));

    // TODO: Update imports and change actual code below once get_it is done
    // await fetchQuestions(subject).then((snapshot) => snapshot.docs.map((e) => questions.add(Question.fromMap(e.data()))));

    return questions;
    }
  }
