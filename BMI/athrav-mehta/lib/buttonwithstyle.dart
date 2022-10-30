import 'package:flutter/material.dart';

class Buttonwithstyle extends StatelessWidget {
  Buttonwithstyle({this.icon, this.onPressed});
  final icon;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        height: 50,
        width: 50,
      ),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Colors.grey,
    );
  }
}
