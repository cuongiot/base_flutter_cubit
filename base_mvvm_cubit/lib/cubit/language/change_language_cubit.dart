import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum LanguageEvent { switchToVietnamese, switchToEnglish, switchToJapanese }

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('vi'));

  void switchToVietnamese() => emit(const Locale('vi'));
  void switchToEnglish() => emit(const Locale('en'));
  void switchToJapanese() => emit(const Locale('ja'));
}
