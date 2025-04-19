import 'package:e_commerce_application/core/components/button/title_elevated_button.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/core/extension/string_extension.dart';
import 'package:e_commerce_application/core/init/lang/locale_keys.g.dart';
import 'package:e_commerce_application/view/auth/register/viewmodel/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterButton extends StatelessWidget {
  final RegisterViewModel viewModel;

  const RegisterButton({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => TitleElevatedButton(
        onPressed: viewModel.isLoading
            ? null
            : () async {
                await viewModel.btnRegisterClicked();
              },
        text: LocaleKeys.register_registerButton.locale,
        color: context.myColors.authButtonColor,
      ),
    );
  }
}
