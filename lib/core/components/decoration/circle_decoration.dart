import 'package:flutter/material.dart';

class CircleDecoration extends Decoration {
  CircleDecoration({required Color color, required double radius}) : _painter = _CirclePainter(color, radius);
  final BoxPainter _painter;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true;
  final Paint _paint;
  final double radius;

  late Offset circleOffset;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    circleOffset = offset +
        Offset(
          cfg.size!.width / 2,
          cfg.size!.height - radius - 5,
        );
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}