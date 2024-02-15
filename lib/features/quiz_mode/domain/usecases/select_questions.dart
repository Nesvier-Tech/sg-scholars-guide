 import 'dart:math';

import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/domain/repositories/collect_questions.dart';

Future<List<Question>> chooseQuestions(SUBJ subj, int numQuestions) async {
  List<Question> totalQuestions = await collectQuestions(subj);
  totalQuestions.shuffle(Random());
  return totalQuestions.sublist(0, numQuestions);  
}