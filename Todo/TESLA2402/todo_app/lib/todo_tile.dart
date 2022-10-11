import 'package:flutter/material.dart';
import 'todo.dart';
import 'package:intl/intl.dart';

class TodoList extends StatelessWidget {
  final List<Todo> listHandler;
  final Function deleteTodo;

  TodoList(this.listHandler, this.deleteTodo);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listHandler.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.calendar_month),
          title: Text(listHandler[index].title),
          subtitle: Text(DateFormat.yMMMEd().format(listHandler[index].date)),
          trailing: IconButton(
              onPressed: () {
                deleteTodo(listHandler[index].id);
              },
              icon: const Icon(Icons.delete),
              color: Colors.black),
        );
      },
    );
  }
}
