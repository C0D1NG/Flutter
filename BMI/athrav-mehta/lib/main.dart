import 'package:flutter/material.dart';
import 'input_page.dart';
import 'resultpage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF1A237E),
        scaffoldBackgroundColor: Colors.blueGrey[800],
        appBarTheme: AppBarTheme(
          color: Colors.blueGrey[900],
        ),
      ),
      home: InputPage(),
      // routes: {
      //   '/calculate': (context) => resultpage(),
      // }
    );
  }
}
