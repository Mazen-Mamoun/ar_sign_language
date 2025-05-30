part of 'exam_cubit.dart';

@immutable
sealed class ExamState {}

final class ExamInitial extends ExamState {}

class ExamLoading extends ExamState {}

class ExamSuccess extends ExamState {
  final List<ExamModel> questions;

  ExamSuccess(this.questions);
}

class ExamError extends ExamState {
  final String message;

  ExamError(this.message);
}
