import 'package:e_commerce_application/core/init/theme/light/light_tema_interface.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'package:flutter/material.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  AppThemeLight._init();

  static AppThemeLight? _instance;

  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  @override
  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: colorSchemeLight.green,
                ),
        tabBarTheme: tabBarTheme(),
        appBarTheme: appBarTheme(),
        fontFamily: ApplicationConstants.FONT_FAMILY,
      );

  AppBarTheme appBarTheme() {
    return AppBarTheme(color: colorSchemeLight.brown);
  }

  TabBarTheme tabBarTheme() {
    return TabBarTheme(
      unselectedLabelStyle:
          textThemeLight.headlineMedium.copyWith(color: colorSchemeLight.red),
      labelPadding: paddingInsets.lowPaddingAll,
    );
  }

  TextTheme textTheme() {
    return TextTheme(
      headlineLarge: textThemeLight.headlineLarge,
      headlineMedium: textThemeLight.headlineMedium,
      headlineSmall: textThemeLight.headlineSmall,
    );
  }

  ColorScheme get _appColorScheme => ColorScheme(
        primary: colorSchemeLight.blue,
        // Mavi ton - Ana renk
        onPrimary: Colors.white,
        // Primary üzerinde yazı/ikonlar
        secondary: colorSchemeLight.green,
        // Yeşil - Vurgu rengi
        onSecondary: Colors.black,
        error: colorSchemeLight.red,
        // Kırmızı - Hata
        onError: Colors.white,
        surface: Colors.white,
        // Kart/dialog arka plan
        onSurface: Colors.black26,
        brightness: Brightness.light,
      );
}
