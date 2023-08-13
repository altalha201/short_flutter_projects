import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/todo_mode.dart';

class DatabaseController {
  static Future<void> saveList(List<ToDoModel> fullList) async {
    final pref = await SharedPreferences.getInstance();
    final serializedList = fullList.map((e) => e.toJson()).toList();
    await pref.setStringList(
      "to_do_list",
      serializedList.map((e) => json.encode(e)).toList(),
    );
  }

  static Future<List<ToDoModel>> getList() async {
    final pref = await SharedPreferences.getInstance();
    final serializedList = pref.getStringList("to_do_list") ?? [];
    return serializedList
        .map((e) => ToDoModel.fromJson(json.decode(e)))
        .toList();
  }

  static Future<bool> getFirstLoadUp() async {
    final pref = await SharedPreferences.getInstance();
    final isFirst = pref.getBool("to_do_first");
    if (isFirst != null) {
      return isFirst;
    }
    return true;
  }

  static Future<void> setFirstLoadUp() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool("to_do_first", false);
  }
}
