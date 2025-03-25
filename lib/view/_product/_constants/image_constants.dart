import 'package:e_commerce_application/core/extension/string_extension.dart';

class ImageConstants {
  ImageConstants._init();

  static ImageConstants? _instance;

  static ImageConstants get instance {
    _instance ??= ImageConstants._init();
    return _instance!;
  }

  final hotDog = "hotdogs".toPNG;

  final relaxSVG = "relax".toSVG;
  final astronautSVG = "astronaut".toSVG;
  final chatSVG = "chat".toSVG;
}
