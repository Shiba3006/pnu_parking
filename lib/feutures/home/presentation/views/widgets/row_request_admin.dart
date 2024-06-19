import 'package:flutter/material.dart';
import 'package:pnu_parking/feutures/home/presentation/views/widgets/custom_underline_border.dart';

class RowRequestAdmin extends StatelessWidget {
  const RowRequestAdmin({
    super.key, required this.text, required this.onTap,
  });
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: TextField(
                  decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 30,
              color: Colors.white,
            ),
            contentPadding: const EdgeInsets.only(left: 0),
            enabled: false,
            border: WhiteUnderlineInputBorder(),
            label: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ))),
        ],
      ),
    );
  }
}
