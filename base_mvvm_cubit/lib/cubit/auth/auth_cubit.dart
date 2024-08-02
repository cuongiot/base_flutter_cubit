import 'package:base_mvvm_cubit/core/constants/app_constants.dart';
import 'package:base_mvvm_cubit/core/utils/shared_preferences_manager.dart';
import 'package:base_mvvm_cubit/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  void login() {
    emit(AuthState(isLogin: true));
  }

  void logout() {
    serviceLocator
        .get<SharedPreferencesManager>()
        .remove(KeyStorageConstants.jwt);
    emit(AuthState(isLogin: false));
  }

  void checkLogin() async {
    final isExpried = await checkExpiredToken();
    if (isExpried) {
      login();
    }
  }

  Future<bool> checkExpiredToken() async {
    final accessToken = serviceLocator
            .get<SharedPreferencesManager>()
            .getString(KeyStorageConstants.jwt) ??
        '';
    if (accessToken.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
