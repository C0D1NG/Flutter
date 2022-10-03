import 'package:flutter/material.dart';
class Todo {
  final String id;
  final String title;
  final int chkbox;
  final DateTime date;

  Todo(
      {@required this.id,
      @required this.title,
      @required this.chkbox,
      @required this.date});
}
