import 'package:flutter/material.dart';

//ignore:must_be_immutable
class EleshopButton extends StatelessWidget{

  double height;
  double? width;
  Color?backgroundColor;
  Widget component;
  Function onpress;

  EleshopButton({
    Key?key,
    this.height=50,
    this.width,
    this.backgroundColor,
    required this.component,
    required this.onpress
  }):super(key:key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap:(){
        onpress();
      },
      child:Container(
        height: height,
        width:width??MediaQuery.of(context).size.width*0.9,
        alignment: Alignment.center,
        decoration:BoxDecoration(
          color:backgroundColor??Colors.yellow,
          borderRadius: BorderRadius.circular(10)
        ),
        child: component,
      ),
    );
  }


}