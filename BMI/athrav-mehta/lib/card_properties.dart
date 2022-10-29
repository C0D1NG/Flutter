import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class cardproperties extends StatelessWidget {
  cardproperties({this.logo, this.name});
  final logo;
  final name;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          logo,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          name,
          style: klabeltext,
        ),
      ],
    );
  }
}
