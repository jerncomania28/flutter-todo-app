import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:todo_app/data/models/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  Random random = Random();

  String _name = 'Alice Johnston';
  String _filterStatus = 'All';
  String? _filterDate;
  String? _taskID;
  final TextEditingController _taskName = TextEditingController();
  String? _taskDescription;
  String? _taskDate;
  String? _taskPriority;

  final List<TodoTaskModel> _tasks = [];

  String get name => _name;
  String get filterStatus => _filterStatus;
  String? get filterDate => _filterDate;
  String? get taskID => _taskID;
  TextEditingController get taskName => _taskName;
  String? get taskDescription => _taskDescription;
  String? get taskDate => _taskDate;
  String? get taskPriority => _taskPriority;
  List<TodoTaskModel> get tasks => _tasks;

  List<TodoTaskModel> get filteredTasks {
    return _tasks.where((task) {
      // If filterStatus is not 'All', then check if task's status matches filterStatus
      if (_filterStatus != 'All' && task.priority != _filterStatus) {
        return false;
      }

      // If filterDate is not null, then check if task's date matches filterDate
      if (_filterDate != null && task.date != _filterDate) {
        return false;
      }

      // If task passes all filters, include it in the filtered list
      return true;
    }).toList();
  }

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void updateFilterStatus(String newStatus) {
    _filterStatus = newStatus;
    notifyListeners();
  }

  void updateFilterDate(String newDate) {
    _filterDate = newDate;
    notifyListeners();
  }

  void updateTaskName(String newTaskName) {
    _taskName.text = newTaskName;
    notifyListeners();
  }

  void updateTaskDescription(String newTaskDescription) {
    _taskDescription = newTaskDescription;
    notifyListeners();
  }

  void updateTaskDate(String newTaskDate) {
    _taskDate = newTaskDate;
    notifyListeners();
  }

  void updateTaskPriority(String newTaskPriority) {
    _taskPriority = newTaskPriority;
    notifyListeners();
  }

  void clearFilters() {
    _filterStatus = 'All';
    _filterDate = null;
    notifyListeners();
  }

  void resetTask() {
    _taskName.clear();
    _taskDescription = null;
    _taskDate = null;
    _taskPriority = null;
    notifyListeners();
  }

  TodoTaskModel getTaskById(String taskId) {
    TodoTaskModel task = _tasks.firstWhere((task) => task.id == taskId);
    _taskID = task.id;
    _taskName.text = task.name!;
    _taskDate = task.date;
    _taskPriority = task.priority;

    print(' get task id: $_taskID');
    print('task name: ${_taskName.text}');
    print('task date: $_taskDate');
    print('task priority: $_taskPriority');
    notifyListeners();

    return TodoTaskModel(
      id: _taskID!,
      name: _taskName.text,
      date: _taskDate,
      priority: _taskPriority,
    );
  }

  void createNewTask() {
    if (_taskDate == null || _taskPriority == null) {
      return;
    }

    String id = random.nextInt(1000).toString();
    _tasks.add(TodoTaskModel(
        id: id,
        name: _taskName.text,
        date: _taskDate,
        priority: _taskPriority));
    notifyListeners();
    resetTask();
  }

  void editTask(String id) {
    if (_taskDate == null || _taskPriority == null) {
      return;
    }

    int index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index] = TodoTaskModel(
        id: id,
        name: _taskName.text,
        date: _taskDate,
        priority: _taskPriority,
      );
      notifyListeners();
      resetTask();
    }
  }
}
