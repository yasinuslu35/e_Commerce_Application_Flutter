import 'package:e_commerce_application/core/components/list_view/indicator_list_view.dart';
import 'package:flutter/material.dart';

class OnBoardIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final double defaultWidth;

  const OnBoardIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
    required this.defaultWidth,
  });

  @override
  Widget build(BuildContext context) {
    return IndicatorListView(
      currentIndex: currentIndex,
      itemCount: itemCount,
      defaultWidth: defaultWidth,
      onListItem: (index) {
        return Container();
      },
    );
  }
}
