import 'package:bloc_test/themes/app_them_bloc.dart';
import 'package:bloc_test/themes/app_theme_data.dart';
import 'package:bloc_test/screens/welcome.dart';
import 'package:bloc_test/widgets/blocs/list_of_descriptions/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
        ),
        BlocProvider<ColorDescriptionsBloc>(
          create: (_) => ColorDescriptionsBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeBlocState>(
        builder: (context, state) {
          return MaterialApp(
            theme: AppThemeData.lightTheme(),
            darkTheme: AppThemeData.darkTheme(),
            themeMode: state.theme,
            home: const WelcomeScreen(),
          );
        },
      ),
    );
  }
}
