
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/widgets/bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
class TaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton:FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: (() {
          showModalBottomSheet<void>(
            context: context,
            builder: (context)=>bottomsheet(),
             );
        }),
        child: Icon(Icons.add),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60,left: 30,bottom: 30,right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start  ,
             children:[
              // CarouselSlider( if we want text slide banner
              //  items: [
              //   Text('make your list daily',style:TextStyle(color: Colors.white),)
              //  ],
              //  options: CarouselOptions(autoPlay: true),
              //   ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.list,size: 30,color: Colors.lightBlueAccent,),
                  radius: 30,
                  ),
                  SizedBox(height: 12),
                Text(
                  'Todoey',
                  style: TextStyle(color: Colors.white,fontWeight:FontWeight.w700,fontSize: 50),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskcount} Tasks',
                  style: TextStyle(color: Colors.white,fontSize: 18),
                ),
               
             ],
            ),
          ),
           Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      
                      borderRadius:BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),
                      ),
                      child: TaskList(),
                  ),
                ),
        ],
      )
    );
  }
}

