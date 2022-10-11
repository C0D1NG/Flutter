import 'package:flutter/material.dart';
class TaskTile extends StatelessWidget {
 final bool isChecked;
  final String textTitle;
  final Function checkboxCallback;
  final Function longpresscallback;

    TaskTile({required this.isChecked,required this.textTitle,required this.checkboxCallback,required this.longpresscallback});
  @override
   
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress:(){longpresscallback();},
      title: Text(textTitle,style:TextStyle(decoration:isChecked ? TextDecoration.lineThrough:null)),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (newValue){
          checkboxCallback();
        }
      
      ),
      
    );
        
  }
}



