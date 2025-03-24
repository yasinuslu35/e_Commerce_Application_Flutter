import 'padding_insets.dart';
import 'text_theme_light.dart';

import 'color_scheme_light.dart';

mixin class ILightTheme {
  TextThemeLight textThemeLight = TextThemeLight.instance;
  ColorSchemeLight colorSchemeLight = ColorSchemeLight.instance;
  PaddingInsets paddingInsets = PaddingInsets();
}
