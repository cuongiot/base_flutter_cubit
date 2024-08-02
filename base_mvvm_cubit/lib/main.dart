import 'package:base_mvvm_cubit/cubit/auth/auth_cubit.dart';
import 'package:base_mvvm_cubit/di/di.dart';
import 'package:base_mvvm_cubit/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('vi', 'VN')],
      path:
          'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..checkLogin(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final AppRouter appRouter = AppRouter(context.read<AuthCubit>());
          return MaterialApp.router(
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter.router,
          );
        },
      ),
    );
  }
}
