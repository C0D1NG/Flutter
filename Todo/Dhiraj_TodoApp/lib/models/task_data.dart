import 'package:flutter/foundation.dart';
import 'tasks.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier{

  List<Task> _tasks = [
    Task(name: 'Provider package is awesome'),
  ];

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }
  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTasktitle){
    final task = Task(name: newTasktitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}