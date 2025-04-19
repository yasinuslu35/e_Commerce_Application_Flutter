import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/auth/register/viewmodel/register_view_model.dart';
import 'package:flutter/material.dart';

class RegisterFooterText extends StatelessWidget {
  final RegisterViewModel viewModel;
  const RegisterFooterText({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LocaleKeys.register_footer_createText.locale),
        TextButton(
          onPressed: () async {
            await viewModel.navigateToLoginPage();
          },
          child: Text(LocaleKeys.register_footer_signUpText.locale),
        ),
      ],
    );
  }
}
