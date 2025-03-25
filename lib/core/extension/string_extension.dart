import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constants.dart';


extension StringLocalization on String {
  String get locale => this.tr();

  String? get isValidEmail =>
      contains(RegExp(ApplicationConstants.EMAIL_REGEX))
          ? null
          : "Email does not valid";
}

extension SVGPATH on String{
  String get toSVG => "asset/svg/$this.svg";
}

extension PNGPATH on String {
  String get toPNG => "asset/image/$this.png";
}
