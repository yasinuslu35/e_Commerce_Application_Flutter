import '../constants/app/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';

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
