import 'package:base_mvvm_cubit/data/models/reponse/info_user_model.dart';
import 'package:base_mvvm_cubit/data/repositories/authen_repository.dart';
import 'package:base_mvvm_cubit/di/di.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'info_user_state.dart';

class InfoUserCubit extends Cubit<InfoUserState> {
  InfoUserCubit() : super(InfoUserInitial());
  final AuthenRepository _authenRepository = serviceLocator();
  Future<void> fetchInfoUser() async {
    try {
      emit(InfoUserLoading());
      final infoUser = await _authenRepository.fetchInfoUser();
      emit(InfoUserLoaded(infoUser));
    } catch (e) {
      emit(InfoUserError(e.toString()));
    }
  }
}
