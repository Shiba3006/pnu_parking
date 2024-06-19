import 'package:flutter/material.dart';

class OnContainer extends StatelessWidget {
  const OnContainer({
    super.key,
    required this.colorWithOpacity,
    required this.colorsList,
  });
  final Color colorWithOpacity;
  final List<Color> colorsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: colorWithOpacity,
            blurRadius: 50,
            spreadRadius: 10,
          ),
        ],
        gradient: RadialGradient(
          colors: colorsList,
        ),
        // color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}
