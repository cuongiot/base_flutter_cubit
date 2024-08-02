import 'package:base_mvvm_cubit/core/constants/app_constants.dart';
import 'package:base_mvvm_cubit/core/utils/shared_preferences_manager.dart';
import 'package:base_mvvm_cubit/di/di.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final pref = serviceLocator.get<SharedPreferencesManager>();
    var jwt = pref.getString(KeyStorageConstants.jwt);
    options.headers["Authorization"] = jwt;
    return super.onRequest(options, handler);
  }

  @override
  onError(DioException err, ErrorInterceptorHandler handler) async {
    // hanlder exception
    super.onError(err, handler);
  }
}
