import 'package:hive/hive.dart';
import 'package:my_habit/models/habit.dart';

class Boxes {
	static Box<Habit> getHabit() => Hive.box<Habit>('habit');
}
