import 'package:chatgpt_app/Screens/chat_screen.dart';
import 'package:chatgpt_app/Theme/assets.dart';
import 'package:chatgpt_app/Theme/colors.dart';
import 'package:chatgpt_app/Theme/styles.dart';
import 'package:chatgpt_app/widgets/indecator_itme.dart';
import 'package:chatgpt_app/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndecatorScreen extends StatefulWidget {
  static const String routeName = '/indecator';
  const IndecatorScreen({super.key});

  @override
  State<IndecatorScreen> createState() => _IndecatorScreenState();
}

class _IndecatorScreenState extends State<IndecatorScreen> {
  final controller = PageController(initialPage: 0);
  final indecatorCount = 3;

  final List<IndecatorItem> indecatorList = [
    IndecatorItem(icon: sun, text: 'Example', textList: textList1),
    IndecatorItem(icon: flash, text: 'Capabilities', textList: textList2),
    IndecatorItem(icon: danger, text: 'Limitations', textList: textList3),
  ];

  @override
  Widget build(BuildContext context) {
    String text = 'Next';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 38.h, horizontal: 20.w),
          child: Column(
            children: [
              Image.asset(
                logo,
                height: 24.h,
                width: 24.w,
                fit: BoxFit.fill,
              ),
              const VerticalSpace(24),
              Text(
                'Welcome to\nChatGPT',
                style: largeText,
              ),
              const VerticalSpace(24),
              Text(
                'Ask anything, get yout answer',
                style: smallText,
              ),
              const VerticalSpace(60),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: indecatorCount,
                  itemBuilder: (context, index) {
                    return indecatorList[index];
                  },
                ),
              ),
              const VerticalSpace(60),
              SmoothPageIndicator(
                controller: controller,
                count: indecatorCount,
                effect: WormEffect(
                    dotWidth: 28.w,
                    dotHeight: 2.h,
                    dotColor: Colors.white.withOpacity(0.20000000298023224),
                    activeDotColor: greenColor,
                    radius: 12.r),
              ),
              const VerticalSpace(20),
              ElevatedButton(
                onPressed: () {
                  if (controller.page!.floor() < indecatorCount - 1) {
                    controller.nextPage(
                      duration: const Duration(
                          milliseconds: 300), // You can adjust the duration
                      curve: Curves.ease,
                    );
                  } else if (controller.page!.floor() == indecatorCount - 1) {
                    Navigator.pushReplacementNamed(
                        context, ChatScreen.routeName);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenColor,
                  fixedSize: Size(335.w, 48.h),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: mediumText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
