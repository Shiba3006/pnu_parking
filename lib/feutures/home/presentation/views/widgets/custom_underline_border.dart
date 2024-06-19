
import 'package:flutter/material.dart';

class WhiteUnderlineInputBorder extends InputBorder {
  @override
  InputBorder copyWith({BorderSide? borderSide}) {
    return WhiteUnderlineInputBorder();
  }

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.only(bottom: 2.0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.bottomLeft.dx, rect.bottomLeft.dy)
      ..lineTo(rect.bottomRight.dx, rect.bottomRight.dy);
  }

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection? textDirection}) {
    final Paint paint = Paint()
      ..color = Colors.white // Set white color
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;
    canvas.drawLine(rect.bottomLeft, rect.bottomRight, paint);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WhiteUnderlineInputBorder && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  bool get isOutline => true;

  @override
  ShapeBorder scale(double t) {
    throw UnimplementedError();
  }
}
