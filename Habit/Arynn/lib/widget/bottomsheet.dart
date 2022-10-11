import 'package:flutter/material.dart';
import 'package:my_habit/data.dart';
import 'package:my_habit/home_page.dart';
import 'package:my_habit/models/color.dart';
import 'package:my_habit/provider/data_habits_provider.dart';
import 'package:my_habit/root.dart';
import 'package:provider/provider.dart';

class GetBottomSheet extends StatefulWidget {
  @override
  State<GetBottomSheet> createState() => _GetBottomSheetState();
}

class _GetBottomSheetState extends State<GetBottomSheet> {
  final bankIcons = DataHabits.bankIcon;
  final _nameHabitController = TextEditingController(); //title
  final _goalsHabitController = TextEditingController(); // goals
  bool statusInput = true;
  bool statusSwitchGoalhabits = false;
  bool statusSwitchRepeatEveryday = false;
  bool statusSwitchReminders = false;
  IconData _iconHabit = Icons.star_rate_rounded; //IconHabit
  String _descGoals = 'times'; //descGoals
  String statusRepeat = 'daily'; //statusRepeat
  int week = 1;
  int month = 1;
  String statusHabits = "active";
  String timeReminders = "Do anytime";
  Map<String, bool> listDays = {
    "Su": true,
    "Mo": false,
    "Tu": false,
    "We": false,
    "Th": false,
    "Fr": false,
    "Sa": false,
  };

  List<Map<String, dynamic>> dataHabits = [
    {
      "title": "Coding",
      "icon": Icons.laptop_mac_rounded,
      "goals": "10",
      "descGoals": "minutes",
      "statusRepeat": "daily",
      "day": {
				"Monday": true,
				"Sunday": false,
				"Tuesday": false,
				"Wednesday": false,
				"Thursday": false,
				"Friday": false,
				"Saturday": false,
			},
      "week": "",
      "month": "",
      "statusHabits": "active",
      "timeReminders": "Do anytime"
    }
  ];


  @override
  void dispose() {
    super.dispose();
    _nameHabitController.dispose();
    _goalsHabitController.dispose();
  }

  @override
  Widget build(BuildContext context) {
			    return Consumer<DataHabitsProvider>(
      builder: (cotext, data, _) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.97,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: DefaultTabController(
                length: 3,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Regular Habit",
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Creating a new habit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              if (_nameHabitController.text.isNotEmpty) {


                                if (data.listDataHabits.length < 3) {
																	print("masukkkkkkkkkkkkkkkkkkkkkkkkkkk");
                                  carouselController.nextPage(
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.ease);
                                } else {
                                  carouselController1.nextPage(
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.ease);
                                }

                                Provider.of<DataHabitsProvider>(context,
                                        listen: false)
                                    .addDatahabits(DataHabits.bankIcon[random
                                        .nextInt(DataHabits.bankIcon.length)]);
                                Navigator.pop(context);
                                statusSwitchGoalhabits = false;
																print("===========================================");
                              } else {
                                setState(() {
                                  statusInput = false;
                                });
                              }
                            },
                            icon: ShaderMask(
                                shaderCallback: (rect) => primaryGradient
                                    .createShader(rect),
                                child: const Icon(
                                  Icons.done_all_rounded,
                                  color: Colors.white,
                                )))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Stack(
                      children: [
                        TextField(
                          controller: _nameHabitController,
                          cursorColor: Colors.lightBlueAccent,
                          style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            hintText: "Name your habit",
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 15.0,
                            ),
                            suffixIcon: statusInput
                                ? null
                                : Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                          ),
                        ),
                        Positioned(
                          bottom: 1,
                          child: Container(
                            height: 1.5,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              gradient: primaryGradient
														),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Color.fromRGBO(21, 21, 70, 1),
                                      title: Text("Choose Icon"),
                                      titleTextStyle: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                      content: SingleChildScrollView(
                                        child: Wrap(
                                          alignment: WrapAlignment.center,
                                          children: [
                                            for (int i = 0;
                                                i < bankIcons.length;
                                                i++)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: ShaderMask(
                                                    shaderCallback: (rect) => primaryGradient
                                                            .createShader(rect),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _iconHabit =
                                                              bankIcons[i];
                                                          Navigator.pop(
                                                              context);
                                                        });
                                                      },
                                                      icon: Icon(
                                                        bankIcons[i],
                                                        size: 36,
                                                      ),
                                                      color: Colors.white,
                                                    )),
                                              ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            icon: ShaderMask(
                                shaderCallback: (rect) => primaryGradient
                                    .createShader(rect),
                                child: Icon(
                                  _iconHabit,
                                  color: Colors.white,
                                  size: 34,
                                ))),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Change Icon",
													style: Theme.of(context).textTheme.headline1,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Goal for Habit',
														style: Theme.of(context).textTheme.headline1,
                          ),
                          Switch(
                              value: statusSwitchGoalhabits,
                              onChanged: (value) {
                                setState(() {
                                  statusSwitchGoalhabits = value;
                                });
                              })
                        ],
                      ),
                      Visibility(
                        visible: statusSwitchGoalhabits,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: _descGoals == "times"
                                            ? Colors.lightBlueAccent
                                            : Colors.grey,
                                        shape: const StadiumBorder(),
                                        fixedSize: Size(
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                40,
                                            40),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _descGoals = "times";
                                        });
                                      },
                                      child: Text(
                                        "of times",
																				style: Theme.of(context).textTheme.headline1,
                                      )),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: _descGoals == "minutes"
                                            ? Colors.lightBlueAccent
                                            : Colors.grey,
                                        shape: const StadiumBorder(),
                                        fixedSize: Size(
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                40,
                                            40),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _descGoals = "minutes";
                                        });
                                      },
                                      child: Text(
                                        "time",
																				style: Theme.of(context).textTheme.headline1,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Stack(
                                children: [
                                  TextField(
                                    controller: _goalsHabitController,
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.lightBlueAccent,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                    decoration: InputDecoration(
                                      hintText: "Input here",
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 15.0,
                                        horizontal: 15.0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 1,
                                    child: Container(
                                      height: 1.5,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        gradient: primaryGradient
																			),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        TabBar(
                          // ============= for get statusRepeat
                          onTap: (index) {
                            if (index == 0) {
                              setState(() {
                                statusRepeat = "daily";
                              });
                            } else if (index == 1) {
                              setState(() {
                                statusRepeat = "weekly";
                              });
                            } else {
                              setState(() {
                                statusRepeat = "monthly";
                              });
                            }
                            print("ini index : $index");
                          },
                          indicatorPadding: const EdgeInsets.all(0.0),
                          indicatorWeight: 3.0,
                          labelPadding:
                              const EdgeInsets.only(left: 0.0, right: 0.0),
                          indicator: const ShapeDecoration(
                              shape: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0.0,
                                      style: BorderStyle.solid)),
                              gradient: primaryGradient,
													),
															tabs: [
                            Container(
                              height: 40,
                              alignment: Alignment.center,
                              color: const Color.fromRGBO(21, 21, 70, 1),
                              child: Text(
                                "Daily",
																style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                            Container(
                              height: 40,
                              alignment: Alignment.center,
                              color: const Color.fromRGBO(21, 21, 70, 1),
                              child: Text(
                                "Weekly",
																style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                            Container(
                              height: 40,
                              alignment: Alignment.center,
                              color: const Color.fromRGBO(21, 21, 70, 1),
                              child: Text(
                                "Monthly",
																style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 160,
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "During these day",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: listDays.map((key, value) => MapEntry(
                                                  key,
                                                  Container(
                                                      width: 43,
                                                      height: 43,
                                                      decoration: const BoxDecoration(
                                                          gradient: primaryGradient,
																													borderRadius:
                                                              BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          14))),
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              listDays[key] =!value;

																															if (listDays.containsValue(false)) {
                                                                statusSwitchRepeatEveryday = false;
                                                              }else{
																																statusSwitchRepeatEveryday = true;
																															}
                                                              week = month = 1;
                                                            });
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            14.0),
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary: value ? Colors.transparent: Colors.grey,
                                                                  shadowColor:
                                                                      Colors
                                                                          .transparent),
                                                          child: Text(
                                                            key,
                                                            style: TextStyle(
                                                                fontSize: 14),
                                                          ))),
                                                ))
                                            .values
                                            .toList()),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Every Days",
																						style: Theme.of(context).textTheme.headline1,
                                          ),
                                          Switch(
                                              value: statusSwitchRepeatEveryday,
                                              onChanged: (value) {
                                                setState(() {
                                                  statusSwitchRepeatEveryday =
                                                      value;
                                                  if (statusSwitchRepeatEveryday) {
                                                    listDays['Su'] = listDays[
                                                        'Mo'] = listDays[
                                                            'Tu'] =
                                                        listDays['We'] =
                                                            listDays[
                                                                'Th'] = listDays[
                                                                    'Fr'] =
                                                                listDays['Sa'] =
                                                                    true;
                                                  } else {
                                                    listDays['Su'] = true;
                                                    listDays['Mo'] = listDays[
                                                        'Tu'] = listDays[
                                                            'We'] =
                                                        listDays['Th'] =
                                                            listDays['Fr'] =
                                                                listDays['Sa'] =
                                                                    false;
                                                  }
                                                  week = month = 1;
                                                });
                                              })
                                        ]),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "$week times a week",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            for (int i = 1; i < 7; i++)
                                              Container(
                                                  width: 43,
                                                  height: 43,
                                                  decoration: const BoxDecoration(
                                                      gradient: primaryGradient,
																											borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  14))),
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          week = i;
                                                          month = 1;
                                                          listDays['Su'] = true;
                                                          listDays['Mo'] = listDays[
                                                              'Tu'] = listDays[
                                                                  'We'] =
                                                              listDays[
                                                                  'Th'] = listDays[
                                                                      'Fr'] =
                                                                  listDays[
                                                                          'Sa'] =
                                                                      false;
                                                        });
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            14.0),
                                                              ),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: week == i
                                                                  ? Colors
                                                                      .transparent
                                                                  : Colors.grey,
                                                              shadowColor: Colors
                                                                  .transparent),
                                                      child: Text(
                                                        i.toString(),
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ))),
                                          ]),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "$month times a month",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(children: [
                                      for (int i = 1; i < 4; i++)
                                        Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            width: 43,
                                            height: 43,
                                            decoration: const BoxDecoration(
                                                gradient: primaryGradient,
																								borderRadius: BorderRadius.all(
                                                    Radius.circular(14))),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    month = i;
                                                    week = 1;
                                                    listDays['Su'] = true;
                                                    listDays['Mo'] = listDays['Tu'] = listDays['We'] =listDays['Th'] =listDays['Fr'] =listDays['Sa'] =false;
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                    ),
                                                    padding: EdgeInsets.zero,
                                                    primary: month == i
                                                        ? Colors.transparent
                                                        : Colors.grey,
                                                    shadowColor:
                                                        Colors.transparent),
                                                child: Text(
                                                  i.toString(),
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ))),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Get Reminders',
													style: Theme.of(context).textTheme.headline1,
                        ),
                        Switch(
                            value: statusSwitchReminders,
                            onChanged: (value) {
                              setState(() {
                                statusSwitchReminders = value;
                              });
                            })
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}
