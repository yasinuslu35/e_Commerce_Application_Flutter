import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final void Function() onPressed;
  final String heroTag;

  const AuthButton({
    super.key,
    this.icon,
    this.color,
    required this.onPressed,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.17,
      height: context.width * 0.17,
      child: FloatingActionButton(
        heroTag: heroTag,
        backgroundColor: context.myColors.lavenderBlush,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.myColors.appBlue,
            width: 2.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: Icon(
          icon,
          size: context.width * 0.1,
          color: color,
        ),
      ),
    );
  }
}
