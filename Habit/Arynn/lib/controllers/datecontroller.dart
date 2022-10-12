import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_habit/widget/boxes.dart';
import '/utils/date_utils.dart' as date_util;

class DateController extends GetxController{
	DateTime dateToday = DateTime.now();
	DateTime currentDateTime = DateTime.now();
//	DateTime dateToday = DateTime(22, 9, 22);
	//DateTime currentDateTime = DateTime(22, 9, 22);
  List<DateTime> currentMonthList = List.empty();
  late ScrollController scrollControllerDateInline;
	int positionWeekDays = 0;
	String today = "";

	List week1 = [];
	List week2 = [];
	List week3= [];
	List week4 = [];

	// Function to set week in month (1-4)
	void setWeekInMonth(){
		for(int i = 0; i < currentMonthList.length; i++){
			if(i < 7) week1.add(currentMonthList[i].day);
			else if(i >= 7 && i < 14) week2.add(currentMonthList[i].day);
			else if(i >= 14 && i < 21) week3.add(currentMonthList[i].day);
			else week4.add(currentMonthList[i].day);
		}
	}

	//Function to check day in week (week 1 or 2,3,4)
	String checkDayInWeek(int day){
		if(day != 0){
			if(week1.contains(day)) return "week1";
			else if(week2.contains(day)) return "week2";
			else if(week3.contains(day)) return "week3";
			else return "week4";
		}else{
			return "";
		}
	}

	void updateCurrentMonthList(DateTime time){
		currentDateTime = time;
		today = date_util.DateUtils.weekdays[currentDateTime.weekday - 1];
		currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
		currentMonthList.sort((a, b) => a.day.compareTo(b.day));
		currentMonthList = currentMonthList.toSet().toList();
		positionWeekDays = date_util.DateUtils.weekdays.indexOf(date_util.DateUtils.weekdays[currentMonthList[0].weekday]);
		update();

	}

	void setCurrentDateTime(DateTime time){
		currentDateTime = time;
		today = date_util.DateUtils.weekdays[currentDateTime.weekday - 1];
		update();
	}

	@override
	  void onInit() {

			setWeekInMonth();
			today = date_util.DateUtils.weekdays[currentDateTime.weekday - 1];

			print("+++++++++++++++++++++++++++++++++");
			print(today);
			print("+++++++++++++++++++++++++++++++++");
			currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
			currentMonthList.sort((a, b) => a.day.compareTo(b.day));
			currentMonthList = currentMonthList.toSet().toList();
			scrollControllerDateInline = ScrollController(initialScrollOffset: 40.0 * currentDateTime.day);
			positionWeekDays = date_util.DateUtils.weekdays.indexOf(date_util.DateUtils.weekdays[currentMonthList[0].weekday]);
			print("DATE CONTROLLER CRESTE");
	    super.onInit();
	  }

	@override
	  void dispose() { 
			scrollControllerDateInline.dispose();
	    super.dispose();
	  }




}
