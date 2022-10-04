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
  DateTime _selectedDate;
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
                      child: Text('Okay'))
                ],
                title: Text('an error has occured'),
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
      builder: (BuildContext context, Widget child) {
            return Theme(
              data: ThemeData.dark().copyWith(
                colorScheme: ColorScheme.light(
                    primary: Colors.amber,
                    
                    ),
                dialogBackgroundColor:Colors.white,
              ),
              child: child,
            );
          },
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
        ? Center(child: CircularProgressIndicator())
        : Container(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 5,
              right: 5,
              left: 5,
            ),
            child: Card(
              color: Color.fromRGBO(254, 247, 216, 1),
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
                        cursorColor: Colors.amber,
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'Add Title',
                          labelStyle: TextStyle(color: Colors.amber),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.amber,
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.amber),
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber)),
                          onPressed: _submitData,
                          child: Text(
                            'Add Todo',
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
