class AuthApiErrorResponse {
  final String? emailError;
  final String? passwordError;
  final String? errorMessage;
  final int statusCode;

  AuthApiErrorResponse({
    required this.emailError,
    required this.passwordError,
    required this.errorMessage,
    required this.statusCode,
  });

  factory AuthApiErrorResponse.fromJson(Map<String, dynamic> jsonData) {
    return AuthApiErrorResponse(
      emailError: jsonData['data']?['email'] != null
          ? jsonData['data']['email'][0]
          : null,
      passwordError: jsonData['data']?['password'] != null
          ? jsonData['data']['password'][0]
          : null,
      errorMessage: jsonData['msg'],
      statusCode: jsonData['status'],
    );
  }
}
