import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_properties.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'buttonwithstyle.dart';
import 'resultpage.dart';
import 'bmibrain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

int height = 180;
int weight = 50;
int age = 18;

class _InputPageState extends State<InputPage> {
  Gender? choosegender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    OnPress: () {
                      setState(() {
                        choosegender = Gender.male;
                      });
                    },
                    cardColor: choosegender == Gender.male
                        ? kfinalcolor
                        : kinitialcolor,
                    cardChild: cardproperties(
                      logo: FontAwesomeIcons.mars,
                      name: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    OnPress: () {
                      setState(() {
                        choosegender = Gender.female;
                      });
                    },
                    cardColor: choosegender == Gender.female
                        ? kfinalcolor
                        : kinitialcolor,
                    cardChild: cardproperties(
                      logo: FontAwesomeIcons.venus,
                      name: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: kinitialcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: klabeltext,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kfontsize,
                      ),
                      Text(
                        'cm',
                        style: klabeltext,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.amberAccent,
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                      overlayColor: Colors.grey,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Colors.amber,
                      inactiveColor: Colors.grey,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                        print(newvalue);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: kinitialcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabeltext,
                        ),
                        Text(
                          weight.toString(),
                          style: kfontsize,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Buttonwithstyle(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Buttonwithstyle(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kinitialcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabeltext,
                        ),
                        Text(
                          age.toString(),
                          style: kfontsize,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Buttonwithstyle(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Buttonwithstyle(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
             BmiBrain bmicalc = BmiBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Resultpage(
                    bmicalculation: bmicalc.calculation(),
                    bmiadvice: bmicalc.resultAdvice(),
                    bmicondition: bmicalc.result(),
                  ),
                ),
              );
            },
            child: Container(
              color: Colors.amber,
              child: Center(
                child: Text('CALCULATE YOUR BMI'),
              ),
              width: double.infinity,
              height: 45.0,
              margin: EdgeInsets.only(top: 5),
            ),
          ),
        ],
      ),
    );
  }
}
