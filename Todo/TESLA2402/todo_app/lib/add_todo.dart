import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTodo extends StatefulWidget {
  final Function addTodo;

  NewTodo(this.addTodo);
  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final _titleController = TextEditingController();
  var isLoading = false;
  late DateTime _selectedDate;
  String dateText = 'Add Date';

  void _submitData() {
    final enteredTitle = _titleController.text;
    if (_selectedDate == null || enteredTitle == null) return;

    setState(() {
      isLoading = true;
    });

    widget.addTodo(enteredTitle, _selectedDate).catchError((error) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Okay'))
                ],
                title: const Text('an error has occured'),
                content: Text(error.toString()),
              ));
    }).then((_) {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pop();
    });
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
          dateText = DateFormat.yMMMEd().format(pickedDate);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Container(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
              right: 5,
              left: 5,
            ),
            child: Card(
              color: const Color.fromARGB(255, 127, 196, 228),
              elevation: 10,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                    right: 10,
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        cursorColor: Colors.blue,
                        autofocus: true,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                          labelStyle: TextStyle(color: Colors.blue),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  style: BorderStyle.solid)),
                        ),
                        controller: _titleController,
                      ),
                      TextButton(
                          onPressed: () {
                            _presentDatePicker();
                          },
                          child: Text(
                            dateText,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          onPressed: _submitData,
                          child: const Text(
                            'Todo',
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
