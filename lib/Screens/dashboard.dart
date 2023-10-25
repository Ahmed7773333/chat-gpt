import 'package:chatgpt_app/Theme/assets.dart';
import 'package:chatgpt_app/Theme/colors.dart';
import 'package:chatgpt_app/Theme/styles.dart';
import 'package:chatgpt_app/widgets/row_dashboard.dart';
import 'package:chatgpt_app/widgets/space.dart';
import 'package:chatgpt_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoard extends StatelessWidget {
  static const String routeName = '/dashBoard';
  DashBoard({super.key});
  final TextEditingController newChatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              CustomTextField(
                controller: newChatController,
                hint: 'New chat',
                preIcon: chat,
                suffIcon: send,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 0,
                      itemBuilder: (context, index) {
                        return Container();
                      })),
              const Divider(
                thickness: 1,
                color: Colors.white,
              ),
              const VerticalSpace(28),
              RowDashBoard(
                  image: delete, text: 'Clear conversations', onPressed: () {}),
              const VerticalSpace(41),
              Row(
                children: [
                  RowDashBoard(
                      image: person, text: 'Upgrade to Plus', onPressed: () {}),
                  const Spacer(),
                  Container(
                    width: 46.w,
                    height: 20.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFAF3AD),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Center(
                      child: Text(
                        'New',
                        style: smallText.copyWith(
                          color: const Color(0xFF887A05),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const VerticalSpace(41),
              RowDashBoard(image: sun, text: 'Light mode', onPressed: () {}),
              const VerticalSpace(41),
              RowDashBoard(image: faq, text: 'Updates & FAQ', onPressed: () {}),
              const VerticalSpace(41),
              RowDashBoard(
                  image: logout,
                  text: 'Logout',
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
