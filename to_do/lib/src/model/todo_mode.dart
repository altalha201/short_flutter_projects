class ToDoModel {
  String? id;
  String? toDoTitle;
  bool? completed;
  String? createdTime;

  ToDoModel({this.id, this.toDoTitle, this.completed, this.createdTime});

  ToDoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    toDoTitle = json['to_do_title'];
    completed = json['completed'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['to_do_title'] = toDoTitle;
    data['completed'] = completed;
    data['created_time'] = createdTime;
    return data;
  }
}
