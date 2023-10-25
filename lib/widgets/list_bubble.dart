// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bubble/bubble.dart';
import 'package:chatgpt_app/Theme/colors.dart';
import 'package:chatgpt_app/Theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final List<CustomBubble> listOfBubblte = [];

class CustomBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  const CustomBubble({
    Key? key,
    required this.text,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bubble(
      margin: BubbleEdges.only(top: 10.h),
      stick: true,
      color: isMe ? blackColor : greenColor,
      nip: isMe ? BubbleNip.leftBottom : BubbleNip.rightBottom,
      child: Text(
        text,
        style: smallText,
      ),
    );
  }
}
