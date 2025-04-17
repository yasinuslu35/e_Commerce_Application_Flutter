import 'package:e_commerce_application/core/extension/string_extension.dart';

class ImageConstants {
  ImageConstants._init();

  static ImageConstants? _instance;

  static ImageConstants get instance {
    _instance ??= ImageConstants._init();
    return _instance!;
  }

  final hotDog = "hotdogs".toPNG;
  final loadingAnimaton = "loading_animation".toJSON;

  final onBoard1 = "onBoard1".toSVG;
  final onBoard2 = "onBoard2".toSVG;
  final onBoard3 = "onBoard3".toSVG;
}
