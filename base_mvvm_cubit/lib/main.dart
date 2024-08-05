import 'package:base_mvvm_cubit/cubit/auth/auth_cubit.dart';
import 'package:base_mvvm_cubit/cubit/language/change_language_cubit.dart';
import 'package:base_mvvm_cubit/di/di.dart';
import 'package:base_mvvm_cubit/generated/l10n.dart';
import 'package:base_mvvm_cubit/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit()..checkLogin(),
        ),
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final AppRouter appRouter = AppRouter(context.read<AuthCubit>());
          return BlocBuilder<LanguageCubit, Locale>(
            builder: (context, currentLocale) {
              return MaterialApp.router(
                  themeMode: ThemeMode.light,
                  debugShowCheckedModeBanner: false,
                  routerConfig: appRouter.router,
                  locale: currentLocale,
                  supportedLocales: const [
                    Locale('vi'),
                    Locale('en'),
                    Locale('ja'),
                  ],
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ]);
            },
          );
        },
      ),
    );
  }
}
