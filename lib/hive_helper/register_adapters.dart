import 'package:hive/hive.dart';
import 'package:chatgpt_app/database/chat.dart';

void registerAdapters() {
  Hive.registerAdapter(ChatAdapter());
}
