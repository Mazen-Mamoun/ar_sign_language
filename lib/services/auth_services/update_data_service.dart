import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:tawasel/Models/auth_models/auth_api_success_response_model.dart';
import 'package:tawasel/helper/Api.dart';
import 'package:tawasel/helper/failure.dart';

class UpdateDataService {
  Future<Either<Failure, AuthApiSuccessResponse>> updateUser({
    required String email,
    required String userName,
    required String token,
  }) async {
    try {
      dynamic jsonData = await Api().put(
        url: 'https://finalproject.mass-fluence.com/api/update-profile',
        userName: userName,
        email: email,
        token: token,
      );

      AuthApiSuccessResponse successData = AuthApiSuccessResponse(
        user: AuthApiSuccessResponse.fromJson(jsonData).user,
        message: AuthApiSuccessResponse.fromJson(jsonData).message,
        statusCode: AuthApiSuccessResponse.fromJson(jsonData).statusCode,
        token: token,
      );

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
