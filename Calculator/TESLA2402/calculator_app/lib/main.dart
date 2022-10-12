import 'package:calculator_app/calculator.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}
