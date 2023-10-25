import 'package:chatgpt_app/Theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  final String? preIcon;
  final String? suffIcon;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hint,
      this.preIcon,
      this.suffIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: smallText,
        prefixIcon: ImageIcon(
          AssetImage(
            preIcon ?? '',
          ),
          size: 24.sp,
          color: Colors.white,
        ),
        suffixIcon: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2.w,
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
