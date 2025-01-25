part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ThemeToggled extends ThemeEvent {
  final AppTheme theme;

  ThemeToggled({required this.theme});
}
