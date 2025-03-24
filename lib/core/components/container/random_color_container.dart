import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class RandomColorContainer extends StatelessWidget {
  final Widget? child;

  const RandomColorContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.randomColor,
      child: child,
    );
  }
}
