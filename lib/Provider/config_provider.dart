import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  Locale currentLanguage = Locale("en");
  void configTheme(ThemeMode newTheme) {
    if (newTheme != currentTheme) {
      currentTheme = newTheme;
    }
    notifyListeners();
  }
  void configLanguage(Locale newLang) {
    if (newLang != currentLanguage) {
      currentLanguage = newLang;
    }
    notifyListeners();
  }
}
