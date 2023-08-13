import 'package:get/get.dart';

import '../model/todo_mode.dart';
import 'database_controller.dart';
import 'utils/controller_utils.dart';

class TaskController extends GetxController {
  bool _gettingList = false;
  bool _firstLoadUp = false;

  List<ToDoModel> _fullList = [];

  final List<ToDoModel> _activeList = [];

  final List<ToDoModel> _completedList = [];

  List<ToDoModel> get fullList => _fullList;
  List<ToDoModel> get activeList => _activeList;
  List<ToDoModel> get completedList => _completedList;
  bool get gettingList => _gettingList;
  bool get firstLoadUp => _firstLoadUp;

  Future<void> getListFromDatabase() async {
    _gettingList = true;
    update();
    _fullList = await DatabaseController.getList();
    if(_fullList.isNotEmpty) {
      _updateLists();
    } else {
      _firstLoadUp = await DatabaseController.getFirstLoadUp();
    }
    _gettingList = false;
    update();
  }

  Future<void> addToList(String taskTitle) async {
    final task = ToDoModel(
      id: ControllerUtils.getRandomString(9),
      toDoTitle: taskTitle,
      completed: false,
      createdTime: DateTime.now().toString(),
    );
    _fullList.add(task);
    _updateLists();
    await DatabaseController.saveList(_fullList);
    update();
  }

  Future<void> deleteItem(ToDoModel task) async {
    _fullList.remove(task);
    _updateLists();
    await DatabaseController.saveList(_fullList);
    update();
  }

  void _updateLists() {
    _completedList.clear();
    _activeList.clear();
    for (var element in _fullList) {
      if (element.completed ?? false) {
        _completedList.add(element);
      } else {
        _activeList.add(element);
      }
    }
  }
}