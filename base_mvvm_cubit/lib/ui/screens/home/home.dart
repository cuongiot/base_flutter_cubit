import 'package:base_mvvm_cubit/cubit/auth/auth_cubit.dart';
import 'package:base_mvvm_cubit/cubit/info_user/info_user_cubit.dart';
import 'package:base_mvvm_cubit/cubit/language/change_language_cubit.dart';
import 'package:base_mvvm_cubit/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfoUserCubit()..fetchInfoUser(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login App"),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: IconButton(
                  onPressed: () {
                    context.read<AuthCubit>().logout();
                  },
                  icon: const Icon(Icons.logout_rounded),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<InfoUserCubit, InfoUserState>(
                listener: (context, state) {
                  if (state is InfoUserError) {
                    // show dialog, snackbar error message
                  }
                },
                builder: (context, state) {
                  if (state is InfoUserLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state is InfoUserLoaded) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          S.current.hello,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          state.infoUser.firstName ?? "--",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
              Text(
                "Welcome 🎉",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              Text(
                S.current.welcome,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.read<LanguageCubit>().switchToEnglish();
                },
                child: const Text('Switch Language English'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.read<LanguageCubit>().switchToVietnamese();
                },
                child: const Text('Switch Language VietNam'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.read<LanguageCubit>().switchToJapanese();
                },
                child: const Text('Switch Language Japan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
