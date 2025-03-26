import '../../extension/context_extension.dart';
import 'package:flutter/material.dart';

class FormIcon extends StatelessWidget {
  final IconData icon;

  const FormIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.height * 0.03,
      ),
      child: Icon(
        icon,
        size: context.width * 0.07,
        color: context.colors.onError,
      ),
    );
  }
}
