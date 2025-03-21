import 'light/color_scheme_light.dart';
import 'light/text_theme_light.dart';

mixin class ILightTheme {
  TextThemeLight textThemeLight = TextThemeLight.instance;
  ColorSchemeLight colorSchemeLight = ColorSchemeLight.instance;
}