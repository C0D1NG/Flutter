import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.cardChild, this.cardColor, this.OnPress});
  final Widget? cardChild;
  final Color? cardColor;
  final OnPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}


