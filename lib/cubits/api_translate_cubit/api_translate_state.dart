part of 'api_translate_cubit.dart';

@immutable
abstract class ApiTranslateState {}

class ApiTranslateInitial extends ApiTranslateState {}

class ApiTranslateLoading extends ApiTranslateState {}

class ApiTranslateSuccess extends ApiTranslateState {
  final String translatedLetter;

  ApiTranslateSuccess(this.translatedLetter);
}

class ApiTranslateError extends ApiTranslateState {
  final String message;

  ApiTranslateError(this.message);
}
