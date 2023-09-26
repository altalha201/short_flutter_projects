import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/todo_model.dart';

class ToDoServices {
  Future<List<ToDoModel>> getAllToDos() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) => ToDoModel.fromJson(e)).toList();
      return todos;
    }
    return [];
  }
}
