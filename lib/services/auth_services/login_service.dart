import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:tawasel/Models/auth_models/auth_api_success_response_model.dart';
import 'package:tawasel/Models/auth_models/user_model.dart';
import 'package:tawasel/helper/Api.dart';
import 'package:tawasel/helper/failure.dart';

class LoginService {
  Future<Either<Failure, AuthApiSuccessResponse>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      dynamic jsonData = await Api().post(
        url: 'https://finalproject.mass-fluence.com/api/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      AuthApiSuccessResponse successData =
          AuthApiSuccessResponse.fromJson(jsonData);

      log(jsonData.toString());

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
