import 'package:flutter/material.dart';

class ColorsPallete {
  static Color kDarkRed = Colors.red[700]!;
  static Color kDarkGreen = Colors.green[700]!;
  static List<Color> kRedColorLis = [
    Colors.red,
    Colors.red[300]!,
    Colors.red[200]!,
  ];

  static List<Color> kGreenColorLis = [
    Colors.green,
    Colors.green[300]!,
    Colors.green[200]!,
  ];
  static Color kRedColorOpacity = Colors.red.withOpacity(0.5);
  static Color kGreenColorOpacity = Colors.green.withOpacity(0.5);
}
