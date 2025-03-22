import '../../extension/context_extension.dart';
import 'package:flutter/material.dart';

class IndicatorListView extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  // Geriye Widget döndüren bir function oluyor.
  final Widget Function(int index) onListItem;

  const IndicatorListView(
      {super.key,
      required this.itemCount,
      required this.onListItem,
      required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: (context, index) => buildPadding(context, index),
    );
  }

  Padding buildPadding(BuildContext context, int index) {
    return Padding(
      padding: context.paddingLow,
      child: buildCircleAvatar(index, context),
    );
  }

  CircleAvatar buildCircleAvatar(int index, BuildContext context) {
    return CircleAvatar(
      backgroundColor: currentIndex == index ? Colors.black12 : Colors.blue,
      radius:
          currentIndex == index ? context.width * 0.03 : context.width * 0.015,
      child: AnimatedOpacity(
        opacity: currentIndex == index ? 1 : 0,
        duration: context.lowDuration,
        child: onListItem(index),
      ),
    );
  }
}
