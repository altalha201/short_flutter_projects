import 'package:flutter/material.dart';

import '../model/todo_model.dart';
import '../services/todo_services.dart';

class ToDoProvider extends ChangeNotifier {
  final _service = ToDoServices();

  bool isLoading = false;

  List<ToDoModel> _todos = [];

  List<ToDoModel> get todos => _todos;

  Future<void> getAllToDos() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAllToDos();
    _todos = response;

    isLoading = false;
    notifyListeners();
  }
}
