import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double value;

  const DefaultTextFormField({
    super.key,
    this.labelText = LocaleKeys.login_email,
    this.icon = Icons.person,
    this.controller,
    this.validator,
    this.value = 1,
  }) : assert(value >= 0 && value <= 1, 'Width must be between 0 and 1');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * value,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          fillColor: context.myColors.textFieldBackground,
          filled: true,
          prefixIcon: Icon(icon),
          labelText: labelText.locale,
        ),
      ),
    );
  }
}
