import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController{
	TimeOfDay _time = TimeOfDay.now();
	bool switchSound = false;
	String morning = "00:00";
	String afternoon = "12:00";
	String evening = "18:00";


	void setSwitchSound(bool value){
		switchSound = value;
		update();
	}


	void selectTime(String day, BuildContext context) async {
    final  newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
			if(day == "morning"){
					_time = newTime;
					morning = _time.toString();
					morning = morning.split("(")[1].split(")")[0];
			}else if(day == "afternoon"){
					_time = newTime;
					afternoon = _time.toString();
					afternoon = afternoon.split("(")[1].split(")")[0];
			}else{
					_time = newTime;
					evening = _time.toString();
					evening = evening.split("(")[1].split(")")[0];
			}
    }
		update();
  }


}
