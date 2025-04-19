import 'package:flutter/material.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: Text(
          LocaleKeys.register_welcomeText.locale,
          style: context.textTheme.headlineMedium,
        ),
      ),
    );
  }
}
