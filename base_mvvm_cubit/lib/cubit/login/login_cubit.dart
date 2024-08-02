import 'package:base_mvvm_cubit/core/constants/app_constants.dart';
import 'package:base_mvvm_cubit/core/utils/shared_preferences_manager.dart';
import 'package:base_mvvm_cubit/data/models/request/login_request.dart';
import 'package:base_mvvm_cubit/data/repositories/authen_repository.dart';
import 'package:base_mvvm_cubit/di/di.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginAppState> {
  LoginCubit() : super(LoginAppInitialState());
  final AuthenRepository _authenRepository = serviceLocator();

  void handleLogin({required String email, required String password}) async {
    try {
      emit(LoginInLoadingState());
      final result = await _authenRepository
          .loginApp(LoginRequest(userName: email, passWord: password));
      serviceLocator
          .get<SharedPreferencesManager>()
          .putString(KeyStorageConstants.jwt, result.token);
      emit(LoggedInState());
    } on DioExceptionType catch (e) {
      emit(LoginErrorState(error: e.name));
    }
  }
}
