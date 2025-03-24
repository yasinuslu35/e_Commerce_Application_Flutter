import 'package:e_commerce_application/core/components/list_view/indicator_list_view.dart';
import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class OnBoardIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const OnBoardIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return IndicatorListView(
      currentIndex: currentIndex,
      itemCount: itemCount,
      defaultWidth: context.width * 0.010,
      onListItem: (index) {
        return Container();
      },
    );
  }
}
