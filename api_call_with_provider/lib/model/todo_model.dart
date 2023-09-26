class ToDoModel {
  int? id;
  int? userId;
  String? title;
  bool? completed;

  ToDoModel({
    this.id,
    this.userId,
    this.title,
    this.completed,
  });

  ToDoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    userId = json['userId'] as int;
    title = json['title'];
    completed = json['completed'] as bool;
  }
}
