import 'package:flutter/material.dart';

class ErrorBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Text(
          'No internet connection. Make sure your Wi-Fi or mobile data is turned on, then try again.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}
