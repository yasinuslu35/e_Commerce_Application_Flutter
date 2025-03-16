import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:flutter/material.dart';

class LocaleText extends StatelessWidget {
  final String value;

  const LocaleText({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(value.locale);
  }
}
