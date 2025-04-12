import 'package:dio/dio.dart';
import 'package:tawasel/Models/auth_models/auth_api_error_response_model.dart';

abstract class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioExecption(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessage: 'Connection timed out. Please try again later.');
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errorMessage: 'Send request timed out. Please try again.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errorMessage:
                'Response timed out. Server took too long to respond.');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            errorMessage: 'Invalid certificate. Secure connection failed.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioException.response!.statusCode!, dioException.response!);
      case DioExceptionType.cancel:
        return ServerFailure(
            errorMessage: 'Request was cancelled. Please retry.');
      case DioExceptionType.connectionError:
        return ServerFailure(
            errorMessage: 'Connection failed. Check your internet connection.');
      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage:
                "An unexpected error occurred. Please try again later.");
      default:
        return ServerFailure(
            errorMessage: 'Oops there is an error. Plaease try again');
    }
  }
  factory ServerFailure.fromBadResponse(int statusCode, Response response) {
    AuthApiErrorResponse errorData =
        AuthApiErrorResponse.fromJson(response.data);
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(errorMessage: 'Bad response. Please try again.');
      case 422:
        return ServerFailure(
          errorMessage: errorData.passwordError ??
              errorData.emailError ??
              errorData.errorMessage ??
              'unExpected error. please try again',
        );
      case 500:
        return ServerFailure(
            errorMessage: 'Internal server error. Please try later');
      default:
        return ServerFailure(
            errorMessage: 'Recieved invalid response: $statusCode');
    }
  }
}
//zxc148@gmail.com
//123456