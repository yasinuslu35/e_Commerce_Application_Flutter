import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class ProductCircleAvatar extends StatelessWidget {
  const ProductCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white.withValues(
        alpha: 1,
      ),
      radius: context.width * 0.1,
      child: AnimatedOpacity(
        opacity: 1,
        duration: context.lowDuration,
        child: Icon(
          Icons.person,
          color: context.myColors.appBlue,
        ),
      ),
    );
  }
}
