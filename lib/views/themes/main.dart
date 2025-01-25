import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/views/counter/counter_bloc.dart';
import 'package:flutter_blocs/views/themes/app_themes.dart';
import 'package:flutter_blocs/views/themes/theme_bloc.dart';

import '../screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => CounterBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            theme: themeState.theme,
            home: Scaffold(
              appBar: AppBar(title: Text('Bloc App'), actions: [
                Row(
                  children: [
                    Icon(Icons.light_mode_outlined),
                    Switch(
                      value: themeState.currentTheme == AppTheme.LightMode,
                      onChanged: (isDarkMode) {
                        // Toggle the theme
                        final newTheme =
                            isDarkMode ? AppTheme.DarkMode : AppTheme.LightMode;

                        context.read<ThemeBloc>().add(
                              ThemeToggled(theme: newTheme),
                            );
                      },
                    ),
                    Icon(Icons.dark_mode_outlined)
                  ],
                )
              ]),
              body: MyHomePage(),
            ),
          );
        },
      ),
    );
  }
}
