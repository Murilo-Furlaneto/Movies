import 'package:flutter/material.dart';

class MyThemeData {
  // Light Theme
  static final ThemeData ligthTheme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      colorScheme:
          const ColorScheme.light(surface: Color.fromARGB(26, 13, 184, 247)));

  // Dark Theme
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade800,
        foregroundColor: Colors.white,
        elevation: 1,
      ),
      colorScheme: const ColorScheme.dark(
          //primary: Colors.teal,
          ));
}
