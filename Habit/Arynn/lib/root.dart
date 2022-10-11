import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hive/hive.dart';
import 'package:my_habit/controllers/animationcontroller.dart';
import 'package:my_habit/controllers/habitcontroller.dart';
import 'package:my_habit/controllers/screencontroller.dart';
import 'package:my_habit/home_page.dart';
import 'package:my_habit/models/color.dart';
import 'package:my_habit/models/habit.dart';
import 'package:my_habit/pages/achievements_page.dart';
import 'package:my_habit/pages/habits_page.dart';
import 'package:my_habit/pages/profile_page.dart';
import 'package:my_habit/widget/onetask_bottomsheet.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:my_habit/widget/regulerhabit_bottomsheet.dart';

final math.Random random = math.Random();
List<String> listDays = [
    'Su',
    'Mo',
    'Tu',
    'We',
    'Th',
    'Fr',
    'Sa',
  ];


class RootPage extends StatelessWidget{
  RootPage({Key? key}) : super(key: key);
	final animationControllerHabit = Get.put(AnimationControllerHabit());
	final habitController = Get.put(HabitController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: GetBuilder<ScreenController>(
					init: ScreenController(),
				//	dispose: (_) => getScreenController.animationControllerBottomSheet.dispose(),
          builder:(controller) => PageStorage(
            bucket: controller.bucket,
            child: controller.currentScreen,
          ),
        ),
        bottomNavigationBar: getBottomBar(context),
        floatingActionButtonLocation: CustomFloatingActionButtonLocation(
            MediaQuery.of(context).size.width * 0.5 - 25,
            MediaQuery.of(context).size.height * 0.89),
        floatingActionButton: SpeedDial(
					icon: Icons.add,
					activeIcon: Icons.close,
					animationDuration: const Duration(milliseconds: 300),
            animationAngle: math.pi /2,
					gradient: primaryGradient,
					gradientBoxShape: BoxShape.circle,
					overlayColor: Colors.black,
					buttonSize: const Size(50, 50),
					overlayOpacity: .75,
					spacing: 20,
					spaceBetweenChildren: 5,
            children: [
              SpeedDialChild(
								backgroundColor: Color.fromRGBO(52, 232, 158, 1),
								onTap: (){
								showModalBottomSheet(
										context: context,
                    backgroundColor: darkBlueOne,
										isScrollControlled: true,
										transitionAnimationController: animationControllerHabit.animationControllerBottomSheet,
										shape: const RoundedRectangleBorder(
												borderRadius: BorderRadius.vertical(top: Radius.circular(35))
												),
										builder: (context) {
											return RegulerHabitBottomSheet();
										} 
									);
								},
								child: const Icon(Icons.calendar_month_rounded, color: darkBlueOne,)),
              SpeedDialChild(
								backgroundColor: Color.fromRGBO(52, 232, 158, 1),
								onTap: (){
									showModalBottomSheet(
										context: context,
										backgroundColor: darkBlueOne,
										isScrollControlled: true,
										transitionAnimationController: animationControllerHabit.animationControllerBottomSheet,
										shape: const RoundedRectangleBorder(
											borderRadius: BorderRadius.vertical(top: Radius.circular(35))
									),
										builder: (context){
											return OneTaskBottomSheet();
										}
								);
								},
								child: const Icon(Icons.event_available_rounded, color: darkBlueOne,)),
							] 
      ),
    );
  }

  Widget getBottomBar(BuildContext context) {
    return GetBuilder<ScreenController>( 
			init: ScreenController(),
		//	dispose: (_) => getScreenController.animationControllerBottomSheet.dispose(),
			builder: (controller) => Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 60,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BottomAppBar(
                    color: Colors.white.withOpacity(0.25),
                    shape: const CircularNotchedRectangle(),
                    notchMargin: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .5 - 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  onPressed: () {
																controller.setCurrentScreen(HomePage(), 0);
                                 //   setState(() {
                                 //     currentScreen = const HomePage();
                                 //     currentTab = 0;
                                 //   });
                                  },
                                  icon: controller.currentTab == 0
                                      ? ShaderMask(
                                          shaderCallback: (rect) => primaryGradient 
                                              .createShader(rect),
                                          child: const Icon(
                                            Icons.format_list_bulleted_rounded,
                                            color: Colors.white,
                                          ))
                                      : const Icon(Icons.format_list_bulleted_rounded,
                                          color: Colors.white)),
                              IconButton(
                                  onPressed: () {
																		controller.setCurrentScreen(Achievements(), 1);
                                    //setState(() {
                                    //  currentScreen = Achievements();
                                    //  currentTab = 1;
                                   // });
                                  },
                                  icon: controller.currentTab == 1
                                      ? ShaderMask(
                                          shaderCallback: (rect) => primaryGradient
                                              .createShader(rect),
                                          child: const Icon(
                                            Icons.pie_chart_outline_rounded,
                                            color: Colors.white,
                                          ))
                                      : const Icon(Icons.pie_chart_outline_rounded,
                                          color: Colors.white))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .5 - 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  onPressed: () {
																		controller.setCurrentScreen(Habits(), 2);
                                   // setState(() {
                                   //   currentScreen = Habits();
                                   //   currentTab = 2;
                                   // });
                                  },
                                  icon: controller.currentTab == 2
                                      ? ShaderMask(
                                          shaderCallback: (rect) => primaryGradient 
                                              .createShader(rect),
                                          child: const Icon(
                                            Icons.access_time_rounded,
                                            color: Colors.white,
                                          ))
                                      : const Icon(Icons.access_time_rounded,
                                          color: Colors.white)),
                              IconButton(
                                  onPressed: () {
																		controller.setCurrentScreen(const Profile(), 3);
                                  //  setState(() {
                                  //    currentScreen = Profile();
                                  //    currentTab = 3;
                                  //  });
                                  },
                                  icon: controller.currentTab == 3
                                      ? ShaderMask(
                                          shaderCallback: (rect) => primaryGradient
                                              .createShader(rect),
                                          child: const Icon(
                                            Icons.account_circle_outlined,
                                            color: Colors.white,
                                          ))
                                      : const Icon(Icons.account_circle_outlined,
                                          color: Colors.white)),
                            ],
                          ),
                        )
                      ],
                    ))),
      ),
    );
  }
}

class CustomFloatingActionButtonLocation
    implements FloatingActionButtonLocation {
  final double x;
  final double y;
  const CustomFloatingActionButtonLocation(this.x, this.y);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    return Offset(x, y);
  }
}
