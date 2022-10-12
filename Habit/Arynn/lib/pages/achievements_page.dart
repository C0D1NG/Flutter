import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_habit/controllers/datecontroller.dart';
import 'package:my_habit/models/color.dart';
import 'package:my_habit/root.dart';
import 'package:my_habit/utils/date_utils.dart' as date_util;
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class Achievements extends StatelessWidget {
  const Achievements({Key? key}) : super(key: key);
	//List<DateTime> current = List.empty();
	//DateTime lastDayOfMonth = DateTime(2022, 8, 1);
		//print("${lastDayOfMonth.month}/${lastDayOfMonth.day}");
		//current = date_util.DateUtils.daysInMonth(lastDayOfMonth);
    //current.sort((a, b) => a.day.compareTo(b.day));
    //current = current.toSet().toList();
		//print(current[0].day);
		//print(date_util.DateUtils.weekdays[current[0].weekday ]);
		//positionWeekDays = date_util.DateUtils.weekdays.indexOf(date_util.DateUtils.weekdays[current[0].weekday]);
		//print("position terbaru = $positionWeekDays");


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
                  child: Column(
					crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Align(
							alignment: Alignment.topLeft,
                          child: Text(
                            "Achievements",
                            style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                          gradient: LinearGradient(begin: Alignment.bottomLeft, colors: [
                            Colors.yellowAccent,
                            Colors.greenAccent,
                            Colors.lightBlueAccent,
                          ]),
													boxShadow: [
														BoxShadow(
															color: Colors.lightBlueAccent.withOpacity(.2),
															blurRadius: 29,
															spreadRadius: 2,
															offset: Offset(10, -10)
														),
													
														BoxShadow(
															color: Colors.yellowAccent.withOpacity(.2),
															blurRadius: 29,
															spreadRadius: 2,
															offset: Offset(-10, 10)
														)

													],
                        ),
                        child: Column(
													mainAxisAlignment: MainAxisAlignment.center,
													crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "82%",
                              style: TextStyle(
																color: darkBlueOne,
                                fontSize: 44,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
														Text("Average percentage of completion",
															style: TextStyle(
																color: darkBlueOne,
																fontSize: 14,
																fontWeight: FontWeight.w500
															),
															textAlign: TextAlign.center,

														)
                          ],
                        ),
                      ),
							const SizedBox(height: 30),

							GetBuilder<DateController>(
								init: DateController(),
							  builder: (controller) => SizedBox(
							  	width: MediaQuery.of(context).size.width,
							  	child: Column(
							  		mainAxisAlignment: MainAxisAlignment.center,
							  		children: [
							  			Text(date_util.DateUtils.months[controller.currentDateTime.month -1] + " " + controller.currentDateTime.year.toString(),
							  				style: Theme.of(context).textTheme.headline1,
							  			),
							  			SizedBox(
							  				width: 329,
							  			  child: Wrap(
							  			  	children: [
							  			  		for(int i = 0; i < listDays.length; i++)
							  			  			Container(
							  								margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
							  								padding: EdgeInsets.zero,
							  			  				width: 35,
							  			  				height: 35,
							  			  				child: Center(child: Text(listDays[i], style: Theme.of(context).textTheme.headline2)),

							  			  			),
							  			  	],
							  			  ),
							  			),
							  			SizedBox(
							  				width: 329,
							  			  child: Wrap(
							  			  	children: [
							  						// Use current (custom date)
							  			  		for(int i = 0; i < controller.positionWeekDays + controller.currentMonthList.length; i++)
							  			  		Container(
							  							margin: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
							  							padding: EdgeInsets.zero,
							  			  			width: 35,
							  			  			height: 35,
							  			  		//	child: i >= positionWeekDays  ? Center(child: Text(currentMonthList[i - positionWeekDays].day.toString())) : null,
							  							child: i >= controller.positionWeekDays ? Stack(
							  							  children: [
							  									SimpleCircularProgressBar(
							  										maxValue: 100,
							  										progressStrokeWidth: 2.5,
							  										backStrokeWidth: 2.5,
							  										progressColors: const [Colors.deepOrangeAccent, Colors.greenAccent, Colors.lightBlueAccent, Colors.purpleAccent],
							  										backColor: Colors.transparent,
							  										fullProgressColor: Colors.greenAccent,
							  										valueNotifier: ValueNotifier(i.toDouble() + 70.0),
							  										mergeMode: true,
							  										animationDuration: 2,
							  							  ),
							  									Center(child: Text(controller.currentMonthList[i - controller.positionWeekDays].day.toString(),
							  									)),
							  								]
							  							): null,
							  			  		),
							  			  	],
							  			  ),
							  			),
							  			const SizedBox(height: 30,),
							  		],
							  	),
							  ),
							),
              ],
              ),
            ),
          ),
        ),
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
								]
								)
							),
						),
					),
      ],
    );
  }
}
