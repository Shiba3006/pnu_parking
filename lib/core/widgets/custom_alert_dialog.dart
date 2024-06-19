import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.subTitle,
    required this.ifOk,
  });
  final String title;
  final String subTitle;
  final Function() ifOk;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(subTitle,
          style: const TextStyle(
            fontSize: 18,
          )),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black45, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: ifOk,
          child: const Text(
            'Ok',
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
