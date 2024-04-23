import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/models/question_model.dart';

abstract class QuizModeRepositoryContract {
  const QuizModeRepositoryContract();

  Future<List<Question>> collectQuestions({required SUBJ subj});

  Future<List> collectComments({required DocumentReference docRef});
}
