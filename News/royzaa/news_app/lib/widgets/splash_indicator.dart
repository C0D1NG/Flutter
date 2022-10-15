import 'package:flutter/material.dart';

class SplashIndicator extends StatelessWidget {
  const SplashIndicator({
    Key? key,
    required this.isHighlighted,
  }) : super(key: key);
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1 / 10,
      child: Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Divider(
          color:
              isHighlighted ? Colors.grey[700] : Colors.grey.withOpacity(0.8),
          thickness: 2.0,
        ),
      ),
    );
  }
}
