import 'dart:async';

import 'package:chatgpt_app/Screens/indicators.dart';
import 'package:chatgpt_app/Theme/assets.dart';
import 'package:chatgpt_app/Theme/styles.dart';
import 'package:chatgpt_app/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chatgpt_app/database/helper.dart';
import 'package:chatgpt_app/Screens/chat_screen.dart';

class SplachScreen extends StatelessWidget {
  static const String routeName = '/splach';
  const SplachScreen({super.key});

  Future<void> _navigateToHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed(ChatHelper.getAll().isEmpty
        ? IndecatorScreen.routeName
        : ChatScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    _navigateToHome(context);

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 195.h,
          width: 169.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                logo,
                height: 106.h,
                width: 106.w,
                fit: BoxFit.fill,
              ),
              const VerticalSpace(40),
              Text(
                'ChatGPT',
                style: largeText.copyWith(fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
