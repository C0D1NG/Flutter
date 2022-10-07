import 'package:flutter/material.dart';
import 'constants.dart';

class IconText extends StatelessWidget {
  final String cardText;
  final IconData cardIcon;
  const IconText({Key? key, required this.cardText, required this.cardIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          cardText,
          style: kCardTextStyle,
        )
      ],
    );
  }
}
