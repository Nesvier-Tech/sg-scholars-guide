import '../../data/repositories/quiz_upload_repository_impl.dart';
import '../../presentation/state_management/quiz_input/quiz_input_cubit.dart';

import '../../../../core/models/question_model.dart';

class UploadQuestions {
  UploadQuestions(
      {required this.questionsToUpload, required this.subjToUpload});

  final List<QuizInputCubit> questionsToUpload;
  final SUBJ subjToUpload;

  Future<void> upload() async {
    await const QuizUploadRepositoryImpl().uploadQuestions(
        questionsToUpload: questionsToUpload, subjToUpload: subjToUpload);
  }
}
