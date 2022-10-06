class TaskModel {
  String title;
  bool completed;

  TaskModel({
    required this.title,
    this.completed = false,
  });

  void toggleCompleted() {
    completed = !completed;
  }
}
