import 'base_text_form_field.dart';
import '../../extension/string_extension.dart';
import '../../init/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';

class BasePasswordTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;

  const BasePasswordTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.obscureText = true,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      icon: Icons.lock,
      suffixIcon: suffixIcon,
      labelText: LocaleKeys.login_password.locale,
    );
  }
}
