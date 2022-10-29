import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'bmibrain.dart';

class Resultpage extends StatelessWidget {
  Resultpage(
      {@required this.bmicalculation,
      @required this.bmicondition,
      @required this.bmiadvice});

  final String? bmicalculation;
  final String? bmicondition;
  final String? bmiadvice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(40, 30, 0, 5),
                child: Text(
                  'Your Result',
                  style: kyourresult,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                cardColor: kinitialcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmicondition!.toUpperCase(),
                      style: kconditionstyle,
                    ),
                    Text(
                      bmicalculation!,
                      style: kbmistyle,
                    ),
                    Text(
                      bmiadvice!,
                      textAlign: TextAlign.center,
                      style: kadvicestyle,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.amber,
                child: Center(
                  child: Text('RE-CALCULATE BMI'),
                ),
                width: double.infinity,
                height: 45.0,
                margin: EdgeInsets.only(top: 5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
