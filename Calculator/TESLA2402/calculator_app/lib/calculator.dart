import 'package:flutter/material.dart'; //imported flutter material package
import 'dart:math';

class Calculator extends StatefulWidget {
  // creating a stateful widget
  @override
  State createState() => new CalculatorState(); // creating the state
}

class CalculatorState extends State<Calculator> {
  var io = "";
  var firstNumber = "";
  var oprator = "";
  var secondNumber = "";
  void calculator() {
    if (oprator == "+") {
      setState(() {
        io =
            (double.parse(firstNumber) + double.parse(secondNumber)).toString();
      });
    } else if (oprator == "-") {
      setState(() {
        io =
            (double.parse(firstNumber) - double.parse(secondNumber)).toString();
      });
    } else if (oprator == "X") {
      setState(() {
        io =
            (double.parse(firstNumber) * double.parse(secondNumber)).toString();
      });
    } else if (oprator == "/") {
      setState(() {
        io =
            (double.parse(firstNumber) / double.parse(secondNumber)).toString();
      });
    } else if (oprator == "%") {
      setState(() {
        io =
            (double.parse(firstNumber) % double.parse(secondNumber)).toString();
      });
    } else if (oprator == "^") {
      setState(() {
        io = pow(double.parse(firstNumber), double.parse(secondNumber))
            .toString();
      });
    }
    if (io.length > 10) {
      setState(() {
        io = io.substring(0, 10);
      });
    }
  }

  void _controller(key) {
    if (key == "=") {
      calculator();
    } else if (key == "AC") {
      setState(() {
        io = "";
        firstNumber = "";
        oprator = "";
        secondNumber = "";
      });
    } else if (key == "C") {
      if (oprator != "" && io == "") {
        setState(() {
          oprator = "";
          io = firstNumber;
          firstNumber = "";
        });
      } else {
        setState(() {
          io = io.substring(0, io.length - 1);
          secondNumber = secondNumber.substring(0, secondNumber.length - 1);
        });
      }
    } else if (["+", "-", "X", "/", "%", "^"].contains(key)) {
      if (secondNumber != "") {
        setState(() {
          firstNumber = io;
          io = "";
          oprator = key;
          secondNumber = "";
        });
      } else {
        setState(() {
          firstNumber = io;
          io = "";
          oprator = key;
        });
      }
    } else {
      if (oprator != "") {
        setState(() {
          io = io + key;
          secondNumber = secondNumber + key;
        });
      } else {
        setState(() {
          io = io + key;
        });
      }
    }
  }

  Widget _button(String key, String type) {
    if (type == "input") {
      return MaterialButton(
        height: 90.0,
        textColor: Colors.black,
        color: Colors.grey,
        onPressed: () => _controller(key),
        child: Text(key,
            style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      );
    } else if (type == "operator") {
      return MaterialButton(
        height: 90.0,
        textColor: Colors.black,
        color: Colors.orange,
        onPressed: () => _controller(key),
        child: Text(key,
            style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      );
    }
    return MaterialButton(
      height: 90.0,
      textColor: Colors.black,
      color: Colors.grey[700],
      onPressed: () => _controller(key),
      child: Text(key,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // creating the widget
    return Scaffold(
        appBar: AppBar(
          //defines the content of the Appbar
          title: const Text(
            "Calculator",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          verticalDirection: VerticalDirection.down, // exp
          textBaseline: TextBaseline.alphabetic, // exp
          crossAxisAlignment: CrossAxisAlignment.baseline, // exp
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  " $firstNumber $oprator $secondNumber \t\t",
                  style: const TextStyle(color: Colors.white70, fontSize: 30.0),
                  textAlign: TextAlign.right,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  " $io \t",
                  style: const TextStyle(color: Colors.white, fontSize: 50.0),
                  textAlign: TextAlign.right,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("%", "operator"),
                _button("^", "operator"),
                _button("C", "operator"),
                _button("AC", "output")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("7", "input"),
                _button("8", "input"),
                _button("9", "input"),
                _button("/", "operator")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("4", "input"),
                _button("5", "input"),
                _button("6", "input"),
                _button("X", "operator")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("1", "input"),
                _button("2", "input"),
                _button("3", "input"),
                _button("+", "operator")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("=", "output"),
                _button("0", "input"),
                _button(".", "input"),
                _button("-", "operator"),
              ],
            ),
          ],
        ));
  }
}
