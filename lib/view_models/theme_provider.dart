import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies/constants/my_theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeMode = MyThemeData.ligthTheme;
  String themeKey = dotenv.get("THEME_KEY");

  ThemeData get themeData => _themeMode;

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _themeMode = _themeMode == MyThemeData.darkTheme
        ? MyThemeData.ligthTheme
        : MyThemeData.darkTheme;
    await prefs.setBool(themeKey, _themeMode == MyThemeData.darkTheme);
    notifyListeners();
  }
}
