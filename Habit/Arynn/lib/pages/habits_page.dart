import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:hive/hive.dart';
import 'package:my_habit/models/color.dart';
import 'package:my_habit/models/habit.dart';
import 'package:my_habit/pages/detail_habit_page.dart';
import 'package:get/get.dart';
import 'package:my_habit/widget/boxes.dart';

class Habits extends StatelessWidget {
  Habits({Key? key}) : super(key: key);
	final box = Boxes.getHabit();


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
										padding: const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 30),
									child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        "Habits",
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromRGBO(123, 223, 230, 1),
                                Color.fromRGBO(88, 148, 119, 1)
                              ]
                              //colors: [Colors.yellowAccent, Colors.greenAccent, Colors.lightBlueAccent]
                              ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(88, 148, 166, 1),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "10 Days",
                            style: TextStyle(
                              color: darkBlueOne,
                              fontSize: 48,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Your current streaks",
                            style: TextStyle(
                              color: darkBlueOne,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: Color.fromRGBO(21, 21, 70, 1),
                                size: 32,
                              ),
                              Text(
                                "13 Days",
                                style: TextStyle(
                                  color: darkBlueOne,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          Text(
                            "Your longest streaks",
                            style: TextStyle(
                              color: darkBlueOne,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            padding:
                                EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color.fromRGBO(67, 206, 162, 1),
                                    Color.fromRGBO(24, 90, 157, 1)
                                  ]),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.event_available_rounded,
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "15 Days",
																			style: Theme.of(context).textTheme.headline3,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "Total perfect days",
																	style: Theme.of(context).textTheme.headline4,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            padding:
                                EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color.fromRGBO(131, 131, 190, 1),
                                    Color.fromRGBO(80, 167, 217, 1)
                                  ]),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.done_rounded,
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "25",
																			style: Theme.of(context).textTheme.headline3,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "Times Completed",
																	style: Theme.of(context).textTheme.headline4,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            padding:
                                EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color.fromRGBO(255, 216, 155, 1),
                                    Color.fromRGBO(25, 84, 123, 1)
                                  ]),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.show_chart_rounded,
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "82%",
																			style: Theme.of(context).textTheme.headline3,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "Total perfect days",
																	style: Theme.of(context).textTheme.headline4,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            padding:
                                EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color.fromRGBO(239, 142, 56, 1),
                                    Color.fromRGBO(16, 141, 199, 1)
                                  ]),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.bar_chart_rounded,
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "1,8",
																			style: Theme.of(context).textTheme.headline3,
                                    )
                                  ],
                                ),
                                Text(
                                  "Average daily",
																	style: Theme.of(context).textTheme.headline4,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "All Habits",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Column(
                      children: [
														ListView.builder(
												  physics: NeverScrollableScrollPhysics(),
												  shrinkWrap: true,
												  itemCount: box.toMap().values.toList().length,
                            itemBuilder: (context, index){ 
														final habit = box.values.toList().cast<Habit>();
												  	return GestureDetector(
														  onTap:() => Get.to(DetailHabit(habit: habit[index],)),
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * .08,
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      border: GradientBoxBorder(
                                        gradient: LinearGradient(
																			  begin: Alignment.bottomLeft,
																			  end: Alignment.topRight,
																			  colors: iconsGradientColors,
																		  ),
																	  ),
																  ),
                                  child: Row(
                                    children: [
                                      ShaderMask(
                                        shaderCallback: (rect) => LinearGradient(
                                          colors: iconsGradientColors,
                                          begin: Alignment.topLeft
																		).createShader(rect),
                                        child: Icon(
																			IconData(habit[index].icon, fontFamily: "MaterialIcons"),
                                          color: Colors.white,
																		  )
																	  ),
                                      SizedBox(width: 10,),
                                      Text(
                                        habit[index].title,
																			//	"niko",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                        )
                                      ],
                                  ),
                                ),
                              );
												}
                          ),
                      ],
                    ),
                  ],
              ),
            ),
          ))),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .18,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(0),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
