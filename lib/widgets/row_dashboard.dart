import 'package:chatgpt_app/Theme/styles.dart';
import 'package:flutter/material.dart';

import 'space.dart';

class RowDashBoard extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onPressed;
  const RowDashBoard(
      {Key? key,
      required this.image,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageIcon(
            AssetImage(image),
            color: text == 'Logout' ? const Color(0xFFEC8C8C) : Colors.white,
          ),
          const HorizontalSpace(10),
          Text(
            text,
            style: text == 'Logout'
                ? smallText.copyWith(color: const Color(0xFFEC8C8C))
                : smallText,
          ),
        ],
      ),
    );
  }
}
