import 'package:hive_flutter/hive_flutter.dart';

import 'chat.dart';

class ChatHelper {
  static const String boxName = 'chatBox';

  static add(Chat category) {
    Box<Chat> categoryBox = Hive.box(boxName);
    categoryBox.add(category);
  }

  static List<Chat> getAll() {
    Box<Chat> categoryBox = Hive.box(boxName);
    return categoryBox.values.toList().cast<Chat>();
  }

  static Chat? getById(int id) {
    Box<Chat> categoryBox = Hive.box(boxName);
    return categoryBox.getAt(id);
  }

  static delete(int id) {
    Box<Chat> categoryBox = Hive.box(boxName);
    categoryBox.deleteAt(id);
  }

  static cler() {
    Box<Chat> categoryBox = Hive.box(boxName);
    categoryBox.clear();
  }
}
