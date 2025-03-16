import 'package:e_commerce_application/core/init/theme/app_theme.dart';
import 'package:flutter/material.dart';

// Normal şartlarda her class'ın bir interface'i olması gerekiyor
// interface dart dilinde tanımlı değil abstract classlara sadece method ismi yazıp
// classlara implement ettirmemiz lazım.
class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance = AppThemeLight._init();

  static AppThemeLight? get instance => _instance;

  AppThemeLight._init();

  ThemeData get theme => ThemeData.light();
}
