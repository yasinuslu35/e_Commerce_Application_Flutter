import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const NormalButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        elevation: WidgetStatePropertyAll(10),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: child,
      ),
    );
  }
}
