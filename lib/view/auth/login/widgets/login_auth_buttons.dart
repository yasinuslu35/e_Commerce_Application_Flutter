import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/view/_product/_widgets/button/auth_button.dart';
import 'package:e_commerce_application/view/auth/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginAuthButtons extends StatelessWidget {
  final LoginViewModel viewModel;
  const LoginAuthButtons({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.7,
      height: context.width * 0.17,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            viewModel.loginAuthButtonModels.length,
                (index) {
              var model = viewModel.loginAuthButtonModels[index];
              return Padding(
                padding:
                EdgeInsets.symmetric(horizontal: context.width * 0.025),
                child: AuthButton(
                  icon: model.icon,
                  color: model.color,
                  heroTag: "buttonLogin$index",
                  onPressed: model.onPressed,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
