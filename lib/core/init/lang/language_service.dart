import 'dart:ui';

class LanguageService {
  LanguageService._init();
  static LanguageService? _instance;
  static LanguageService get instance {
    _instance ??= LanguageService._init();
    return _instance!;
  }

  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
