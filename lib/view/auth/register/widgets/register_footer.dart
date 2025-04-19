import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/auth/register/viewmodel/register_view_model.dart';
import 'package:e_commerce_application/view/auth/register/widgets/register_auth_buttons.dart';
import 'package:e_commerce_application/view/auth/register/widgets/register_footer_text.dart';
import 'package:flutter/material.dart';

class RegisterFooter extends StatelessWidget {
  final RegisterViewModel viewModel;

  const RegisterFooter({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Center(
        child: Column(
          children: [
            Text(LocaleKeys.login_footer_orText.locale),
            SizedBox(height: context.width * 0.03),
            RegisterAuthButtons(viewModel: viewModel),
            SizedBox(height: context.width * 0.03),
            RegisterFooterText(viewModel: viewModel),
          ],
        ),
      ),
    );
  }
}
