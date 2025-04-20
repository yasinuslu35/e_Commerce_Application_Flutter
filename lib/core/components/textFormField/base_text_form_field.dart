import 'form_icon.dart';
import '../../extension/context_extension.dart';
import 'package:flutter/material.dart';

class BaseTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final IconData icon;
  final bool obscureText;
  final String? labelText;
  final Widget? suffixIcon;

  const BaseTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.labelText,
    this.suffixIcon,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        labelStyle: context.textTheme.titleSmall,
        suffixIcon: suffixIcon,
        icon: FormIcon(
          icon: icon,
        ),
      ),
    );
  }
}
