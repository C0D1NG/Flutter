import 'package:flutter/material.dart';
import 'components/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';

  var output = '';

  void result() {
    String finalUserInput = userInput.replaceAll('x', '*');
    Parser parser = Parser();
    Expression expression = parser.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    var eval = expression.evaluate(EvaluationType.REAL, contextModel);
    output = eval.toStringAsFixed(3);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF22252D),
        // backgroundColor: Colors.grey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      child: Text(
                        userInput.toString(),
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      alignment: Alignment.bottomRight,
                    ),
                    Text(
                      output.toString(),
                      style: TextStyle(fontSize: 50.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    CalculatorButtons(
                      buttonName: 'AC',
                      onPress: () {
                        userInput = '';
                        output = '';
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: '+/-',
                      onPress: () {
                        userInput += '+/-';
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: '%',
                      onPress: () {
                        userInput += '%';
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: '/',
                      buttonTextColor: Color(0xFFE97777),
                      onPress: () {
                        userInput += '/';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CalculatorButtons(
                      buttonName: '7',
                      onPress: () {
                        userInput += '7';
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: '8',
                      onPress: () {
                        userInput += '8';
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: '9',
                      onPress: () {
                        userInput += '9';
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: 'x',
                      buttonTextColor: Color(0xFFE97777),
                      onPress: () {
                        userInput += 'x';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CalculatorButtons(
                      buttonName: '4',
                      onPress: () {
                        userInput += '4';
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: '5',
                      onPress: () {
                        userInput += '5';
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: '6',
                      onPress: () {
                        userInput += '6';
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: '-',
                      buttonTextColor: Color(0xFFE97777),
                      onPress: () {
                        userInput += '-';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CalculatorButtons(
                      buttonName: '1',
                      onPress: () {
                        userInput += '1';
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: '2',
                      onPress: () {
                        userInput += '2';
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: '3',
                      onPress: () {
                        userInput += '3';
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: '+',
                      buttonTextColor: Color(0xFFE97777),
                      onPress: () {
                        userInput += '+';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CalculatorButtons(
                      buttonName: 'DEL',
                      onPress: () {
                        userInput =
                            userInput.substring(0, userInput.length - 1);
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: '0',
                      onPress: () {
                        userInput += '0';
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: '.',
                      onPress: () {
                        userInput += '.';
                        setState(() {});
                      },
                    ),
                    CalculatorButtons(
                      buttonName: '=',
                      buttonTextColor: Color(0xFFE97777),
                      onPress: () {
                        result();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
