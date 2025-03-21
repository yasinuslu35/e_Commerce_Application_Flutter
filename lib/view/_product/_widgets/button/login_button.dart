import 'package:e_commerce_application/core/components/button/icon_button.dart';
import 'package:flutter/material.dart';

class EcommerceLoginButton extends StatelessWidget {
  final Function(String data) onComplete;

  const EcommerceLoginButton({
    super.key,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return IconNormalButton(
      onPressed: onComplete("Yasin"),
      icon: Icons.access_alarm,
    );
  }
}
