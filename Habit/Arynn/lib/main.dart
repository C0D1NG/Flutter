import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_habit/controllers/datecontroller.dart';
import 'package:my_habit/controllers/habitcontroller.dart';
import 'package:my_habit/models/color.dart';
import 'package:my_habit/models/habit.dart';
import 'package:my_habit/provider/data_habits_provider.dart';
import 'package:my_habit/root.dart';
import 'package:my_habit/widget/boxes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
	WidgetsFlutterBinding.ensureInitialized();

	// initalize hive
	await Hive.initFlutter();
	Hive.registerAdapter(HabitAdapter());
	await Hive.openBox<Habit>('habit');

	final dateController = Get.put(DateController());

	// initalize sharedpreferences
	final box = Boxes.getHabit();
	final pref = await SharedPreferences.getInstance();
	final int? day = pref.getInt("day");
//	final int? month = pref.getInt("month");
//	final int? year = pref.getInt("year");
	if(day != null) {
		if(day != dateController.dateToday.day ){
			box.toMap().forEach((key, value) {
				print("masuk ke map");
				value.currentGoals = 0;
				value.status = "active";
				value.save();
			},);
		}
	}
	pref.setInt("day", dateController.dateToday.day);
//	pref.setInt("month", dateController.dateToday.month);
//	pref.setInt("year", dateController.dateToday.year);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataHabitsProvider>(
			create: (context) => DataHabitsProvider(),
      child: GetMaterialApp(
			theme: buildTheme(),
			debugShowCheckedModeBanner: false,
			home: RootPage(),	
		),
    );
  }
}

