import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  AppThemeData._();

  static ThemeData lightTheme() {
    return ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 39, 163, 225),
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.nunitoTextTheme().copyWith(
            titleLarge: const TextStyle(
              color:  Color.fromARGB(255, 0, 0, 0),
            ),
            titleMedium: const TextStyle(
              color: Colors.black,
            )),
        appBarTheme: const AppBarTheme(
            actionsIconTheme: IconThemeData(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            backgroundColor: Color.fromARGB(255, 14, 126, 230)));
  }

  static ThemeData darkTheme() {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 68, 0, 131),
            brightness: Brightness.dark),
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.nunitoTextTheme().copyWith(
            titleLarge: const TextStyle(
              color: Colors.white,
            ),
            titleMedium: const TextStyle(
              color: Colors.white,
            )));
  }
}
