
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz_card/quiz_card_cubit.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input/quiz_input_cubit.dart';

import '../../../../core/models/question_model.dart';

abstract class QuizUploadRepositoryContract {
  const QuizUploadRepositoryContract();

  Future<void> uploadQuestions({required List<QuizInputCubit> questionsToUpload, required SUBJ subjToUpload});
}