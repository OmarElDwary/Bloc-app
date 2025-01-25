import 'package:flutter/material.dart';

enum AppTheme { LightMode, DarkMode }

final appThemes = {
  AppTheme.LightMode:
      ThemeData(brightness: Brightness.light, primaryColor: Color(0xff008FB1)),
  AppTheme.DarkMode:
      ThemeData(brightness: Brightness.dark, primaryColor: Color(0xffC9D3CB))
};
