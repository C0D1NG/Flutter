import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);

  Size get screenSize => mq.size;

  double get screenDensity => mq.devicePixelRatio;

  EdgeInsets get screenPadding => mq.padding;

  double get screenWidth => mq.size.width;

  double get screenHeight => mq.size.height;
}
