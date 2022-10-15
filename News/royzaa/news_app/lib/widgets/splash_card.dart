import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashCard extends StatelessWidget {
  const SplashCard({
    Key? key,
    this.height,
    this.width,
    required this.image,
    required this.title,
  }) : super(key: key);
  final double? height, width;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            image,
            fit: BoxFit.fitWidth,
            height: 150,
          ),
          Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
