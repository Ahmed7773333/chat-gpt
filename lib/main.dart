import 'dart:io';

import 'package:chatgpt_app/Screens/dashboard.dart';
import 'package:chatgpt_app/Screens/indicators.dart';
import 'package:chatgpt_app/Screens/splach.dart';
import 'package:chatgpt_app/Theme/theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart' as hive;
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'Screens/chat_screen.dart';
import 'database/chat.dart';
import 'database/helper.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  hive.Hive.registerAdapter(ChatAdapter());
  await Hive.openBox<Chat>(ChatHelper.boxName);
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
        initialRoute: SplachScreen.routeName,
        theme: mode,
        routes: {
          SplachScreen.routeName: (context) => const SplachScreen(),
          IndecatorScreen.routeName: (context) => const IndecatorScreen(),
          DashBoard.routeName: (context) => DashBoard(),
          ChatScreen.routeName: (context) => const ChatScreen(),
        },
      ),
    );
  }
}
