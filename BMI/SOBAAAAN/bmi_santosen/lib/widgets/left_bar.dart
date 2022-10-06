import 'package:bmi_santosen/constants/app_constants.dart';
import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  final double barWidth;

  const LeftBar({ Key, required this.barWidth}) : super();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: accentColor),
        ),
      ],
    );
  }
}