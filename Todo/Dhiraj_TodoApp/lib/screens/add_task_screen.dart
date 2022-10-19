import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/models/tasks.dart';

late String newTasktitle;

class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'ADD TASK',
              textAlign: TextAlign.center,
              style: GoogleFonts.oswald(
                fontSize: 30.0,
                color: Colors.blueAccent,
              ),
            ),
            TextField(
              style: GoogleFonts.lato(
                fontSize: 30.0,
              ),
              autofocus: true,
              textAlign: TextAlign.center,
              cursorHeight: 30.0,
              cursorWidth: 2.5,
              onChanged: (newText) {
                newTasktitle = newText;
                // print(newTasktitle);
              },
            ),
            ElevatedButton(
              child: Text(
                'Add',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                  Provider.of<TaskData>(context, listen: false).addTask(
                      newTasktitle);
                  Navigator.pop(context);

              },
            ),
          ],
        ),
      ),
    );
  }
}
