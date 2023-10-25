import 'package:chatgpt_app/Screens/dashboard.dart';
import 'package:chatgpt_app/Screens/indicators.dart';
import 'package:chatgpt_app/Screens/splach.dart';
import 'package:chatgpt_app/Theme/theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screens/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: GPTTestScreen.routeName,
        theme: mode,
        routes: {
          SplachScreen.routeName: (context) => const SplachScreen(),
          IndecatorScreen.routeName: (context) => const IndecatorScreen(),
          DashBoard.routeName: (context) => DashBoard(),
          GPTTestScreen.routeName: (context) => GPTTestScreen(),
        },
      ),
    );
  }
}
