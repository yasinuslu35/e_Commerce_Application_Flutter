import 'normal_button.dart';
import 'package:flutter/material.dart';

class IconNormalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const IconNormalButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Center(
        child: Icon(icon),
      ),
    );
  }
}
