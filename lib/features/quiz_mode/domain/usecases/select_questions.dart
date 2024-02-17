import 'dart:math';

import 'package:scholars_guide/features/quiz_mode/data/repositories/quiz_mode_repository_impl.dart';
import '../../../../core/models/question_model.dart';

class ChooseQuestions {
  ChooseQuestions({required this.subj, required this.numQuestions});

  final SUBJ subj;
  final int numQuestions;

  Future<List<Question>> choose() async {
    List<Question> totalQuestions =
        await const QuizModeRepositoryImpl().collectQuestions(subj: subj);
    totalQuestions.shuffle(Random());
    print('======== HERE ARE THE QUESTIONS ========');
    print(totalQuestions);
    print('======== ===================== ========');

    return totalQuestions.sublist(0, numQuestions);
  }
}
