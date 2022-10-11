import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';
import 'dart:collection';
 class TaskData extends ChangeNotifier{
    List<Task> _tasks = [
    Task(name: 'buy foods'),
    Task(name: 'buy books'),
    Task(name: 'buy grocery'),
  ];

  int get taskcount{
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  void updatetask(Task task){
    task.toggleDone();
    notifyListeners();
  }

   void deletetask(Task task){
    _tasks.remove(task);
    notifyListeners();
   }

  void addtask(String newtasktitle){
    final task=Task(name: newtasktitle);
    _tasks.add(task);
    notifyListeners();
  }
 }