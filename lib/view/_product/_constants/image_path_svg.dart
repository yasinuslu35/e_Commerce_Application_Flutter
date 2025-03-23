import 'package:e_commerce_application/core/extension/string_extension.dart';

class SVGImage {
  SVGImage._init();

  static SVGImage? _instance;

  static SVGImage get instance {
    _instance ??= SVGImage._init();
    return _instance!;
  }

  final relaxSVG = "relax".toSVG;
  final astronautSVG = "astronaut".toSVG;
  final chatSVG = "chat".toSVG;
}
