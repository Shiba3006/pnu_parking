import 'package:flutter/material.dart';

class ErrorContainerMessage extends StatelessWidget {
  const ErrorContainerMessage({
    super.key, required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
