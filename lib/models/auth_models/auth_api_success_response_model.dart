import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/auth_cubit/auth_cubit.dart';
import 'package:tawasel/Models/auth_models/user_model.dart';

class AuthApiSuccessResponse {
  final UserModel user;
  final String token;
  final String message;
  final int statusCode;

  AuthApiSuccessResponse({
    required this.message,
    required this.statusCode,
    required this.user,
    required this.token,
  });

  factory AuthApiSuccessResponse.fromJson(Map<String, dynamic> jsonData) {
    return AuthApiSuccessResponse(
      user: jsonData['data']['user'] != null
          ? UserModel.fromJson(jsonData['data']['user'])
          : UserModel.fromJson(jsonData['data']),
      token: jsonData['data']['token'] ?? '',
      message: jsonData['msg'],
      statusCode: jsonData['status'],
    );
  }
}
