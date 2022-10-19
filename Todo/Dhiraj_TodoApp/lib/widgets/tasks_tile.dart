import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
   TasksTile({required this.taskText , required this.isChecked,  required this.checkboxCallback, required this.longPressCallback});
  final String taskText;
  final bool isChecked;
  dynamic checkboxCallback;
  dynamic longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskText,
        style: TextStyle(
          fontSize: 20.0,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.blueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      )
    );
  }
}

