import 'package:hive/hive.dart';
import 'package:chatgpt_app/hive_helper/hive_types.dart';
import 'package:chatgpt_app/hive_helper/hive_adapters.dart';
import 'package:chatgpt_app/hive_helper/fields/chat_fields.dart';

part 'chat.g.dart';

@HiveType(typeId: HiveTypes.chat, adapterName: HiveAdapters.chat)
class Chat extends HiveObject {
  Chat({required this.messageFromMe, required this.messageFromGPT});
  @HiveField(ChatFields.messageFromMe)
  String messageFromMe;
  @HiveField(ChatFields.messageFromGPT)
  String messageFromGPT;
}
