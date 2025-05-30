part of 'submit_cubit.dart';

@immutable
sealed class SubmitState {}

final class SubmitInitial extends SubmitState {}

final class SubmitLoading extends SubmitState {}

final class SubmitSuccess extends SubmitState {
  final num score;

  SubmitSuccess(this.score);
}

final class SubmitError extends SubmitState {
  final String message;

  SubmitError(this.message);
}
