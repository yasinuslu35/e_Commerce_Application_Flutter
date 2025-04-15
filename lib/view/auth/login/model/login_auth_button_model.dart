import 'package:flutter/cupertino.dart';

class LoginAuthButtonModel {
  final IconData icon;
  final Color color;
  final void Function() onPressed;

  LoginAuthButtonModel({
    required this.icon,
    required this.color,
    required this.onPressed,
  });
}
