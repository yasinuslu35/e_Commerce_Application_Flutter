import 'package:e_commerce_application/core/extension/context_extension.dart';

import 'normal_button.dart';
import 'package:flutter/material.dart';

class TitleElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? color;

  const TitleElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: context.textTheme.headlineSmall?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
