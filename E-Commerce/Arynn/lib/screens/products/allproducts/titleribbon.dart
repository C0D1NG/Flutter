

import 'package:flutter/material.dart';


class TitleRibon extends StatelessWidget{

  final String title;
  final double containerHeight;
  final Color backgroundColor;

  const TitleRibon({
    Key?key,
    required this.title,
    required this.backgroundColor,
    this.containerHeight=50
  }):super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
        height:containerHeight,
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
              const SizedBox(width: 20),
              Expanded(child:Text(title,style:const TextStyle(fontSize:18,color:Colors.black,fontWeight:FontWeight.w400)))
            
          ]
        ),
    );
  }
}