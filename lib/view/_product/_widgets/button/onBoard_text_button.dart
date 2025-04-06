import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/view/auth/onboard/viewmodel/on_board_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnboardTextButton extends StatelessWidget {
  final OnBoardViewModel viewModel;
  final String buttonType;
  final void Function()? onPressed;
  final Color? color;

  const OnboardTextButton(
      {super.key,
      required this.viewModel,
      required this.buttonType,
      this.onPressed,
      this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: context.width * 0.05,
          fontWeight: FontWeight.w600,
        ),
        foregroundColor: color,
      ),
      child: Text(buttonType).tr(),
    );
  }
}
