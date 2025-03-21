import 'normal_button.dart';
import 'package:flutter/material.dart';

class TitleElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const TitleElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
