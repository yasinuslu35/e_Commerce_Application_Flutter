import 'package:e_commerce_application/core/constants/enums/app_theme_enum.dart';
import 'package:e_commerce_application/core/init/theme/app_theme_light.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;

  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes themes) {
    if (themes == AppThemes.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }

    notifyListeners();
  }
}
