part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {
  final ThemeData theme;
  final AppTheme currentTheme;

  ThemeState(this.theme, this.currentTheme);
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super(appThemes[AppTheme.LightMode]!, AppTheme.LightMode);
}

class ThemeChanged extends ThemeState {
  ThemeChanged(super.theme, super.currentTheme);
}
