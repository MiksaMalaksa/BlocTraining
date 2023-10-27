import 'package:flutter/material.dart';

class AppTheme {
  ThemeMode mode;
  IconData data;

  AppTheme({required this.mode, required this.data});
}

List<AppTheme> appThemes = [
  AppTheme(mode: ThemeMode.light, data: Icons.light_mode),
  AppTheme(mode: ThemeMode.dark, data: Icons.dark_mode),
];
