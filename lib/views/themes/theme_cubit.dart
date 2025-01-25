import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blocs/views/themes/app_themes.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(AppTheme.LightMode));

  void toggleTheme(AppTheme newTheme) {
    emit(ThemeState(newTheme));
  }
}
