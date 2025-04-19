import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: Text(
          LocaleKeys.login_welcomeText.locale,
          style: context.textTheme.headlineMedium,
        ),
      ),
    );
  }
}
