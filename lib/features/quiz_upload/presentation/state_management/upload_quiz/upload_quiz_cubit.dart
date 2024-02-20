import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/models/question_model.dart';
import '../../../data/repositories/quiz_upload_repository_impl.dart';
import '../quiz_input/quiz_input_cubit.dart';

part 'upload_quiz_state.dart';

class UploadQuizCubit extends Cubit<UploadQuizState> {
  UploadQuizCubit({required this.questions, required this.subj})
      : super(UploadQuizLoading());

  final List<QuizInputCubit> questions;
  final SUBJ subj;

  void uploadQuiz() async {
    await const QuizUploadRepositoryImpl()
        .uploadQuestions(questionsToUpload: questions, subjToUpload: subj);

    emit(UploadQuizLoaded());
  }
}
