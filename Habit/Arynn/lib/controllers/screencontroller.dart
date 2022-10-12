import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_habit/home_page.dart';
import 'package:my_habit/pages/achievements_page.dart';
import 'package:my_habit/pages/habits_page.dart';
import 'package:my_habit/pages/profile_page.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController {
  var currentTab = 0;
  List<Widget> screen = [HomePage(), Achievements(), Habits(), const Profile()];

  final PageStorageBucket bucket = PageStorageBucket();
   Widget currentScreen =  HomePage();


	void setCurrentScreen (Widget screen, var tab){
		currentScreen = screen;
		currentTab = tab;
		update();
	}
}
