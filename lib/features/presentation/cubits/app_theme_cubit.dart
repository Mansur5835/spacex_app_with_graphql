import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/local_source/local_storage.dart';
import '../style/app_theme.dart';
part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit({required this.localStorage}) : super(AppThemeState());

  LocalStorage localStorage;

  init() {
    emit(AppThemeState(isDark ? AppTheme.dark() : AppTheme.light(), isDark));
  }

  bool get isDark => localStorage.readData(BoxKeys.APP_MODE) ?? false;

  void swicheTheme(bool isDarkMode) async {
    ThemeData themeData = isDarkMode ? AppTheme.dark() : AppTheme.light();

    localStorage.writeData(BoxKeys.APP_MODE, isDarkMode);

    emit(state.copyWith(state
      ..themeData = themeData
      ..isDark = isDarkMode));
  }
}
