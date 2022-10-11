
import 'package:flutter/material.dart';

class LeadingAppBar extends StatelessWidget implements PreferredSizeWidget{

  final List<Color> backgroundColor;
  final double headerSize;

  const LeadingAppBar({Key?key,this.backgroundColor = const [Color(0xFF66e4e8)],this.headerSize=100}):super(key:key);

  @override
  Size get preferredSize => Size.fromHeight(headerSize);

  @override
  Widget build(BuildContext context){
    return AppBar (
        backgroundColor: backgroundColor[0],
        leading: const Icon(Icons.menu),
      );
  }
}

class LeadingActionsAppBar extends StatelessWidget implements PreferredSizeWidget{

  final List<Color> backgroundColor;
  final double headerSize;

  const LeadingActionsAppBar({Key?key,this.backgroundColor = const [Color(0xFF66e4e8)],this.headerSize=100}):super(key:key);


  @override
  Size get preferredSize => Size.fromHeight(headerSize);

  @override
  Widget build(BuildContext context){
    return AppBar (
        backgroundColor: backgroundColor[0],
        leading: const Icon(Icons.menu),
        actions:const <Widget>[Icon(Icons.person)]
      );
  }
}