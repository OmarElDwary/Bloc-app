import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blocs/views/themes/app_themes.dart';
import 'package:flutter_blocs/views/themes/theme_bloc.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeToggled>((event, emit) {
      final theme = state.currentTheme == AppTheme.LightMode
          ? AppTheme.DarkMode
          : AppTheme.LightMode;

      emit(ThemeChanged(appThemes[theme]!, theme));
    });
  }
}
