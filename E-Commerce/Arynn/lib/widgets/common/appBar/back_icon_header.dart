
import 'package:flutter/material.dart';

//ignore:must_be_immutable
class BackIconHeader extends StatelessWidget implements PreferredSizeWidget{

  final double headerSize;
  final double marginTop;
  final String? title;
  Function onpress;

  BackIconHeader({Key?key,this.headerSize=100,this.marginTop=10,this.title,required this.onpress}):super(key:key);

  @override
  Size get preferredSize => Size.fromHeight(headerSize);

  Widget getTitle(dynamic title){
    Widget defaultWidget = const SizedBox();
    if (title != null){
      defaultWidget =  Text(title,style: const TextStyle(fontSize:18,color:Colors.black),);
    }
    return defaultWidget;
  }

  @override
  Widget build(BuildContext context){
       return Container(
              width:MediaQuery.of(context).size.width,
              height:headerSize,
              margin:EdgeInsets.only(top:marginTop),
              alignment:Alignment.centerLeft,
              child:Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Expanded(
                    child:Container(
                      alignment:Alignment.centerLeft,
                      child:Container(
                        alignment:Alignment.center,
                        margin:const EdgeInsets.only(left:20),
                        width:40,
                        height:40,
                        decoration:BoxDecoration(color:const Color(0xFFdce0de),borderRadius:BorderRadius.circular(40)),
                        child:IconButton(
                          highlightColor:Colors.transparent,
                          icon:const Icon(Icons.arrow_back,color:Colors.black),
                          onPressed: ()=>onpress(context),
                        ),
                      ), 
                    ),
                  ), 
                  SizedBox(
                    child: getTitle(title),
                  ),
                  const Expanded(child:SizedBox())
                ],
              )
              
            
      );
  }
}