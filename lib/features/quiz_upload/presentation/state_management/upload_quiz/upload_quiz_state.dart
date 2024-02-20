part of 'upload_quiz_cubit.dart';

sealed class UploadQuizState extends Equatable {
  const UploadQuizState();

  @override
  List<Object> get props => [];
}

final class UploadQuizLoading extends UploadQuizState {}

final class UploadQuizLoaded extends UploadQuizState {}

