import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tawasel/Models/auth_models/auth_api_success_response_model.dart';
import 'package:tawasel/Services/auth_services/login_service.dart';
import 'package:tawasel/Services/auth_services/register_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AuthLoading());
    var result = await RegisterService().registerUser(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    result.fold(
      (failure) => emit(AuthFailure(errorMessage: failure.errorMessage)),
      (data) {
        emit(AuthSuccess(authApiSuccessData: data));
      },
    );
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    var result = await LoginService().loginUser(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthFailure(errorMessage: failure.errorMessage)),
      (data) {
        emit(AuthSuccess(authApiSuccessData: data));
      },
    );
  }
}
