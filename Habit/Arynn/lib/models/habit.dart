import 'package:hive/hive.dart';
part 'habit.g.dart';


@HiveType(typeId: 0)
class Habit extends HiveObject{

	@HiveField(0)
	late String type;

	@HiveField(1)
	late DateTime start;

	@HiveField(2)
	late String title;

	@HiveField(3)
	late int icon;

	@HiveField(4)
	late int goals;

	@HiveField(5)
	late int currentGoals;

	@HiveField(6)
	late String descGoals;

	@HiveField(7)
	late String statusRepeat;

	@HiveField(8)
	late Map<String, bool> day;

	@HiveField(9)
	late int week;

	@HiveField(10)
	late int month;

	@HiveField(11)
	late String status;

	@HiveField(12)
	late List<String> timeReminders;

	@HiveField(13)
	late List completeDay;

	@HiveField(14)
	late int currentStreaks;

	@HiveField(15)
	late int longestStreaks;
}
