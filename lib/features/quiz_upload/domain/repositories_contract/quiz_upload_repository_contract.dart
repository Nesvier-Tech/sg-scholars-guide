import '../../../../core/models/question_model.dart';
import '../../presentation/state_management/quiz_input/quiz_input_cubit.dart';

abstract class QuizUploadRepositoryContract {
  const QuizUploadRepositoryContract();

  Future<void> uploadQuestions(
      {required List<QuizInputCubit> questionsToUpload,
      required SUBJ subjToUpload});
}
