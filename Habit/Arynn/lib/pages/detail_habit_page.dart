import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_habit/controllers/datecontroller.dart';
import 'package:my_habit/home_page.dart';
import 'package:my_habit/models/color.dart';
import 'package:my_habit/models/habit.dart';
import 'package:my_habit/root.dart';
import 'package:my_habit/utils/date_utils.dart' as date_util;
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class DetailHabit extends StatelessWidget {
  DetailHabit({Key? key, this.habit}) : super(key: key);
	Habit? habit;


	bool checkDate(int day, int month, int year){
		for(int i = 0; i < habit!.completeDay.length; i++){
			if(habit!.completeDay[i]["day"] == day && habit!.completeDay[i]["month"] == month && habit!.completeDay[i]["year"] == year){
				return true;
			}
		}
		return false;
	}	
	int getIndexCompleteDay(int day, int month, int year){
		for(int i = 0; i < habit!.completeDay.length; i++){
			if(habit!.completeDay[i]["day"] == day && habit!.completeDay[i]["month"] == month && habit!.completeDay[i]["year"] == year){
				return i;
			}
		}
		return 0;
	}


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
			onWillPop: () async{
				Get.find<DateController>().updateCurrentMonthList(DateTime.now());
				print("Masuk banckkkkkkkkkkkkkkkkkkkkkkkkkkk");
				Get.back();
				return false;
				
			},
      child: Stack(
        children: [
          Scaffold(
              body: SafeArea(
                  child: SingleChildScrollView(
              child: Padding(
              padding:
                  const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
													Get.find<DateController>().updateCurrentMonthList(DateTime.now());
													Get.back();
												}, 

                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        habit!.title,
                        style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                      ),
											IconButton(
												onPressed: (){
													habit!.delete();
													Get.back();
												}, 
												icon: Icon(Icons.delete_outline_rounded, color: Colors.white,)
											)
                    ],
                  ),
                  const SizedBox(
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
                        const SizedBox(
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
                              const SizedBox(
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
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Average daily",
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
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Total perfect days",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                        ),
                     ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Trip of habit",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
								const SizedBox(height: 30,),
                  GetBuilder<DateController>(
									init: DateController(),
                    builder: (controller) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
													mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
														IconButton(
															onPressed: (){
																if(controller.currentDateTime.month > habit!.start.month){
																	controller.updateCurrentMonthList(DateTime(controller.currentDateTime.year,controller.currentDateTime.month - 1, controller.currentDateTime.day));
																	Get.back();
																	Get.to(DetailHabit(habit: habit,));
																}
															}, 
															icon: Icon(Icons.arrow_back_ios_rounded, color: controller.currentDateTime.month > habit!.start.month ? Colors.white : Colors.white10,)),
                              Text(
                                date_util.DateUtils.months[controller.currentDateTime.month - 1] +
                                    " " +
                                    controller.currentDateTime.year.toString(),
                                style: Theme.of(context).textTheme.headline1,
                              ),
														IconButton(
															onPressed: (){
																if(controller.currentDateTime.month < controller.dateToday.month){
																	controller.updateCurrentMonthList(DateTime(controller.currentDateTime.year,controller.currentDateTime.month + 1, controller.currentDateTime.day));
																	Get.back();
																	Get.to(DetailHabit(habit: habit,));
																}
															}, 
															icon: Icon(Icons.arrow_forward_ios_rounded, color: controller.currentDateTime.month < controller.dateToday.month ? Colors.white: Colors.white10,)),
                            ],
                          ),
                          SizedBox(
                            width: 329,
                            child: Wrap(
                              children: [
                                for (int i = 0; i < listDays.length; i++)
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 5),
                                    padding: EdgeInsets.zero,
                                    width: 35,
                                    height: 35,
                                    child: Center(
                                        child: Text(listDays[i],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2)),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 329,
                            child: Wrap(
                              children: [
                                // Use current (custom date)
                                for (int i = 0; i < controller.positionWeekDays + controller.currentMonthList.length; i++)
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 12),
                                    padding: EdgeInsets.zero,
                                    width: 35,
                                    height: 35,
                                    //	child: i >= positionWeekDays  ? Center(child: Text(currentMonthList[i - positionWeekDays].day.toString())) : null,
                                    child: i >= controller.positionWeekDays
                                        ? Stack(children: [
                                            SimpleCircularProgressBar(
                                              maxValue: 100,
                                              progressStrokeWidth: 2.5,
                                              backStrokeWidth: 2.5,
                                              progressColors: const [
                                                Colors.deepOrangeAccent,
                                                Colors.greenAccent,
                                                Colors.lightBlueAccent,
                                                Colors.purpleAccent
                                              ],
                                              backColor: Colors.white.withOpacity(.05),
                                              fullProgressColor: Colors.greenAccent,
                                              valueNotifier: ValueNotifier(
																						checkDate(controller.currentMonthList[i - controller.positionWeekDays].day, controller.currentMonthList[i - controller.positionWeekDays].month, controller.currentMonthList[i - controller.positionWeekDays].year) ?	(( habit!.completeDay[getIndexCompleteDay(controller.currentMonthList[i - controller.positionWeekDays].day, controller.currentMonthList[i - controller.positionWeekDays].month, controller.currentMonthList[i - controller.positionWeekDays].year)]["finishGoals"] / habit!.completeDay[getIndexCompleteDay(controller.currentMonthList[i - controller.positionWeekDays].day, controller.currentMonthList[i - controller.positionWeekDays].month, controller.currentMonthList[i - controller.positionWeekDays].year)]["goals"]) * 100 ) : 0.0 
																							),
                                              mergeMode: true,
                                              animationDuration: 2,
                                            ),
                                            Center(
                                                child: Text(
                                              controller.currentMonthList[i - controller.positionWeekDays].day.toString(),
                                            )),
                                          ])
                                        : null,
                                  ),
                              ],
                            ),
                          ),
										],
                      ),
                    ),
                  ),
								const SizedBox(
                          height: 80,
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
      ),
    );
  }
}
