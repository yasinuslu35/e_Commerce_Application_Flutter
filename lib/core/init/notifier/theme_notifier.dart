import 'package:e_commerce_application/core/constants/enums/app_theme_enum.dart';
import 'package:e_commerce_application/core/init/theme/app_theme_light.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;

  AppThemes _currentThemeEnum = AppThemes.LIGHT;

  ThemeData get currentTheme => _currentTheme;
  AppThemes get currentThemeEnum => _currentThemeEnum;

  void changeValue(AppThemes themes) {
    if (themes == AppThemes.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }

    notifyListeners();
  }

  void changeTheme() {
    if (_currentThemeEnum == AppThemes.LIGHT) {
      _currentTheme = ThemeData.dark();
      _currentThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = AppThemeLight.instance.theme;
      _currentThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }
}
