import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:tawasel/Models/auth_models/auth_api_success_response_model.dart';
import 'package:tawasel/helper/Api.dart';
import 'package:tawasel/helper/failure.dart';

class RegisterService {
  Future<Either<Failure, AuthApiSuccessResponse>> registerUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      dynamic jsonData = await Api().post(
        url: 'https://finalproject.mass-fluence.com/api/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
        },
        token: '',
      );

      AuthApiSuccessResponse successData =
          AuthApiSuccessResponse.fromJson(jsonData);

      return Right(successData);
    } on DioException catch (e) {
      if (e.response != null) {
        return Left(ServerFailure.fromDioExecption(e));
      } else {
        return Left(ServerFailure.fromDioExecption(e));
      }
    } on Exception catch (e) {
      return Left(
        ServerFailure(errorMessage: e.toString()),
      );
    }
  }
}
