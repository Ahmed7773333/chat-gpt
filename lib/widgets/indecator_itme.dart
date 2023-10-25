// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatgpt_app/widgets/container_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:chatgpt_app/Theme/styles.dart';
import 'package:chatgpt_app/widgets/space.dart';

class IndecatorItem extends StatelessWidget {
  final String icon;
  final String text;
  final List<String> textList;

  const IndecatorItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.textList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.w,
      height: 313.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 20.h,
            width: 20.w,
            fit: BoxFit.fill,
          ),
          const VerticalSpace(12),
          Text(text, style: mediumText),
          const VerticalSpace(40),
          ContainerText(text: textList[0]),
          const VerticalSpace(16),
          ContainerText(text: textList[1]),
          const VerticalSpace(16),
          ContainerText(text: textList[2]),
        ],
      ),
    );
  }
}

final List<String> textList1 = [
  '"Explain quantum computing in simple terms"',
  '"Got any creative ideas for a 10 year old’s birthday?"',
  '"How do I make an HTTP request in Javascript?"'
];
final List<String> textList2 = [
  'Remembers what user said earlier in the conversation',
  'Allows user to provide follow-up corrections',
  'Trained to decline inappropriate requests'
];
final List<String> textList3 = [
  'May occasionally generate incorrect information',
  'May occasionally produce harmful instructions or biased content',
  'Limited knowledge of world and events after 2021'
];
