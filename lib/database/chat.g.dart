// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatAdapter extends TypeAdapter<Chat> {
  @override
  final int typeId = 0;

  @override
  Chat read(BinaryReader reader) {
    return Chat(
      messageFromMe: reader.read() as String,
      messageFromGPT: reader.read() as String,
    );
  }

  @override
  void write(BinaryWriter writer, Chat obj) {
    writer
      ..write(obj.messageFromMe)
      ..write(obj.messageFromGPT);
  }
}
