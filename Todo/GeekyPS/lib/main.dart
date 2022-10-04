import 'dart:convert';

import 'package:flutter/material.dart';

import './models/todo.dart';
import './widgets/new_todo.dart';
import './widgets/todo_list.dart';
import 'package:http/http.dart' as http;
import './models/http_exception.dart';

void main() {
  runApp(MyAppi());
}

class MyAppi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      routes: {'/': (context) => MyApp()},
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _isLoading = false;
  @override
  void initState() {
    setData();
    super.initState();
  }

  Future<void> setData() async {
    setState(() {
      _isLoading = true;
    });
    final url = Uri.https(
        'todo-list-635f3-default-rtdb.firebaseio.com', '/products.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      final List<Todo> loadedTodo = [];
      extractedData.forEach((id, data) {
        loadedTodo.add(Todo(
            id: id,
            title: data['title'],
            chkbox: data['checkbox'],
            date: DateTime.parse(data['date'])));
      });

      setState(() {
        todoList = loadedTodo;
        _isLoading = false;
      });

      print(todoList[0].title);
    } catch (error) {
      throw error;
    }
  }

  List<Todo> todoList = [];
  final url = Uri.https(
      'todo-list-635f3-default-rtdb.firebaseio.com', '/products.json');
  Future<void> _addTodo(String title, DateTime date) async {
    final response = await http.post(url,
        body: json.encode({
          'title': title,
          'checkbox': 0,
          'date': date.toString(),
          'id': DateTime.now().toIso8601String()
        }));

    print(response);
    Todo tx = Todo(
        id: json.decode(response.body)['name'],
        title: title,
        chkbox: 0,
        date: date);

    setState(() {
      todoList.add(tx);
    });
    print(tx.id);
  }

  void showModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {}, // this ensures nothing is done onTap on the modal
            child: NewTodo(_addTodo),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  Future<void> deleteTodo(String id) async {
    print(id);

    final url = Uri.https(
        'todo-list-635f3-default-rtdb.firebaseio.com', '/products/$id.json');

    final existIndex = todoList.indexWhere((element) => element.id == id);
    var exitsProd = todoList[existIndex];
    setState(() {
      todoList.removeAt(existIndex);
    });

    final response = await http.delete(url);

    print(json.decode(response.body));

    if (response.statusCode >= 400) {
      setState(() {
        todoList.add(exitsProd);
      });

      throw HttpException('Could Not Delete the Item');
    }

    // setState(() {
    //   todoList.removeWhere((tx) {
    //     return tx.id == id;
    //   });
    // });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(
              child: SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    color: Colors.amber,
                    backgroundColor: Colors.white,
                  )))
          : TodoList(todoList, deleteTodo),
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          onPressed: () {
            showModal(context);
          },
          child: Icon(Icons.add),
        );
      }),
    );
  }
}
