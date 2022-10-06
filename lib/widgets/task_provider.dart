import 'package:flutter/material.dart';
import 'package:pdmi6/models/task_model.dart';
import 'dart:collection';

class TodoProvider with ChangeNotifier {
  List<TaskModel> _tasks = [];

  UnmodifiableListView<TaskModel> get allTasks => UnmodifiableListView(_tasks);
  void addTask(String task) {
    _tasks.add(TaskModel(title: task, completed: false));
    notifyListeners();
  }

  void toggleTask(TaskModel task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTask(TaskModel task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
