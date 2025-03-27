import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class RandomColorContainer extends StatelessWidget {
  final Widget? child;
  final double? height;

  const RandomColorContainer({
    super.key,
    this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.randomColor,
      height: height,
      child: child,
    );
  }
}
