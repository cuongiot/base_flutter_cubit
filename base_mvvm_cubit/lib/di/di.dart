import 'package:base_mvvm_cubit/core/network/base_dio.dart';
import 'package:base_mvvm_cubit/core/utils/navigation_service.dart';
import 'package:base_mvvm_cubit/core/utils/shared_preferences_manager.dart';
import 'package:base_mvvm_cubit/cubit/auth/auth_cubit.dart';
import 'package:base_mvvm_cubit/cubit/language/change_language_cubit.dart';
import 'package:base_mvvm_cubit/data/repositories/authen_repository.dart';
import 'package:base_mvvm_cubit/data/service/authen_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt serviceLocator = GetIt.instance;
Future setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(
      () => SharedPreferencesManager(sharedPreferences: sharedPreferences));
  serviceLocator.registerLazySingleton(() => NavigationService());
  serviceLocator.registerLazySingleton<BaseDio>(() => BaseDio());
// dio
  final baseDio = serviceLocator<BaseDio>();
  final dio = baseDio.createDio();
  serviceLocator.registerLazySingleton<Dio>(() => dio);

  //service
  serviceLocator.registerLazySingleton<AuthenService>(() => AuthenService(dio));

  // repository
  serviceLocator
      .registerLazySingleton<AuthenRepository>(() => AuthenRepositoryImpl(
            authenService: serviceLocator(),
          ));

  // cubit
  serviceLocator.registerLazySingleton(() => AuthCubit());
  serviceLocator.registerLazySingleton(() => LanguageCubit());
}
