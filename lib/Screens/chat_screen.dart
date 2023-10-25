// ignore_for_file: library_private_types_in_public_api

import 'package:chatgpt_app/Network/api_manager.dart';
import 'package:chatgpt_app/Network/chat_model.dart';
import 'package:chatgpt_app/Screens/dashboard.dart';
import 'package:chatgpt_app/Theme/assets.dart';
import 'package:chatgpt_app/Theme/colors.dart';
import 'package:chatgpt_app/Theme/styles.dart';
import 'package:chatgpt_app/database/chat.dart';
import 'package:chatgpt_app/database/helper.dart';
import 'package:chatgpt_app/widgets/list_bubble.dart';
import 'package:chatgpt_app/widgets/open_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = '/chat';

  const ChatScreen({super.key});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _promptController = TextEditingController();
  // ignore: unused_field
  String _response = "";

  Future<void> _getGPTResponse() async {
    final prompt = _promptController.text;
    try {
      final GPTResponce response = await ApiManager.getGPTResponse(prompt);
      if (ChatHelper.getAll().isEmpty) {
        Chat chat = Chat(messageFromMe: prompt, messageFromGPT: '');
        ChatHelper.add(chat);
        listOfBubblte.add(CustomBubble(
            text: ChatHelper.getById(0)?.messageFromMe ?? '', isMe: true));
      }
      if (ChatHelper.getAll().length == 1) {
        Chat chat = Chat(
            messageFromMe: '',
            messageFromGPT:
                response.choices?.first.text ?? "No response received");
        ChatHelper.add(chat);
        listOfBubblte.add(CustomBubble(
            text: ChatHelper.getById(1)?.messageFromGPT ?? '', isMe: false));
      } else if (ChatHelper.getAll().length % 2 == 0) {
        Chat chat = Chat(messageFromMe: prompt, messageFromGPT: '');
        ChatHelper.add(chat);
        listOfBubblte.add(CustomBubble(
            text: ChatHelper.getById(ChatHelper.getAll().length - 1)
                    ?.messageFromMe ??
                '',
            isMe: true));
      } else if (ChatHelper.getAll().length % 2 != 0) {
        Chat chat = Chat(
            messageFromMe: '',
            messageFromGPT:
                response.choices?.first.text ?? "No response received");
        ChatHelper.add(chat);
        listOfBubblte.add(CustomBubble(
            text: ChatHelper.getById(ChatHelper.getAll().length - 1)
                    ?.messageFromGPT ??
                '',
            isMe: false));
      }
      setState(() {
        _response = response.choices?.first.text ?? "No response received";
      });
      _promptController.clear();
    } catch (e) {
      setState(() {
        _response = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: OpenContainers(
            closedWidget: const Icon(
              Icons.list,
              color: Colors.white,
            ),
            openedWidget: DashBoard()),
        backgroundColor: Colors.transparent,
        actions: const [ImageIcon(AssetImage(logo))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: listOfBubblte.length,
                itemBuilder: (context, index) {
                  return listOfBubblte[index];
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.sp),
              child: TextField(
                style: smallText,
                controller: _promptController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Colors.white)),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Colors.white)),
                    focusColor: Colors.white,
                    filled: true,
                    fillColor: blackColor,
                    suffixIcon: InkWell(
                      onTap: _getGPTResponse,
                      child: Container(
                        width: 36.w,
                        height: 36.h,
                        padding: EdgeInsets.all(8.sp),
                        decoration: ShapeDecoration(
                          color: greenColor,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(4.r)),
                        ),
                        child: const Center(
                          child: ImageIcon(
                            AssetImage(send),
                          ),
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Colors.white))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
