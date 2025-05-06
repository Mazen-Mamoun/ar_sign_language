import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tawasel/Models/auth_models/auth_api_success_response_model.dart';
import 'package:tawasel/Services/auth_services/login_service.dart';
import 'package:tawasel/Services/auth_services/register_service.dart';
import 'package:tawasel/Services/auth_services/update_data_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthApiSuccessResponse? cubitUserData;

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
        cubitUserData = data;
                        _storeToken(data.token);

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
        cubitUserData = data;
                        _storeToken(data.token);

        emit(AuthSuccess(authApiSuccessData: data));
      },
    );
  }

  Future<void> updateUser({
    required String email,
    required String name,
    required String token,
  }) async {
    emit(AuthLoading());
    var result = await UpdateDataService().updateUser(
      email: email,
      userName: name,
      token: token,
    );
    result.fold(
      (failure) => emit(AuthFailure(errorMessage: failure.errorMessage)),
      (data) {
        cubitUserData = data;
                        _storeToken(data.token);

        emit(AuthSuccess(authApiSuccessData: data));
      },
    );
  }

  AuthApiSuccessResponse? getUserData() => cubitUserData;

  Future<void> _storeToken(String token) async {
    var box = await Hive.openBox(kAuthBox); 
    await box.put('token', token); 
  }

  Future<String> getToken() async {
    var box = await Hive.openBox(kAuthBox);
    return box.get('token');
  }
}
