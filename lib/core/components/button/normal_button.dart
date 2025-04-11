import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;

  const NormalButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: context.paddingNormal,
        child: child,
      ),
    );
  }
}

/*
        elevation: const WidgetStatePropertyAll(10),
        backgroundColor: WidgetStatePropertyAll(color),
 */