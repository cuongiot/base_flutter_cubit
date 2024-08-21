import 'package:base_mvvm_cubit/core/base/base_response/error_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_state.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit(initialState) : super(initialState);
}
