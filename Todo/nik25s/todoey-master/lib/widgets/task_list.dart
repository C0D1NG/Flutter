import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
class TaskList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskdata,child){
        return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
              isChecked: taskdata.tasks[index].isDone,//here taskdata=Provider.of<TaskData>(context) by the help of consumer we made this name short as a taskdata by consumer widget
              textTitle: taskdata.tasks[index].name,
              checkboxCallback: () {
               taskdata.updatetask(taskdata.tasks[index]);
              },
              longpresscallback: (){
                taskdata.deletetask(taskdata.tasks[index]);
              },
              );
        },
        itemCount: taskdata.taskcount,
      );
      }
     
    );
  }
}

