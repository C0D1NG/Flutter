import 'package:flutter/material.dart';

import 'SCREENS/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xFF99D9D9),
          scaffoldBackgroundColor: const Color(0xFF99D9D9)),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}
