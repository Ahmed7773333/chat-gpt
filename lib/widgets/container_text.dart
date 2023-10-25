import 'package:chatgpt_app/Theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerText extends StatelessWidget {
  final String text;
  const ContainerText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 62.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.07999999821186066),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Center(
        child: Text(
          text,
          style: smallText,
        ),
      ),
    );
  }
}
