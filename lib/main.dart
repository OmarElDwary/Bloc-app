import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/views/counter/counter_cubit.dart';
import 'package:flutter_blocs/views/themes/theme_cubit.dart';
import 'package:flutter_blocs/views/themes/app_themes.dart';

import 'views/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => CounterCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            theme: appThemes[themeState.currentTheme],
            home: Scaffold(
              appBar: AppBar(title: Text('Bloc App'), actions: [
                Row(
                  children: [
                    Icon(Icons.light_mode_outlined),
                    Switch(
                      value: context.read<ThemeCubit>().state.currentTheme ==
                          AppTheme.LightMode,
                      onChanged: (isDarkMode) {
                        final newTheme =
                            isDarkMode ? AppTheme.LightMode : AppTheme.DarkMode;

                        context.read<ThemeCubit>().toggleTheme(newTheme);
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
