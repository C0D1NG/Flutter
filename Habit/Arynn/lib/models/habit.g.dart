// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitAdapter extends TypeAdapter<Habit> {
  @override
  final int typeId = 0;

  @override
  Habit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Habit()
      ..type = fields[0] as String
      ..start = fields[1] as DateTime
      ..title = fields[2] as String
      ..icon = fields[3] as int
      ..goals = fields[4] as int
      ..currentGoals = fields[5] as int
      ..descGoals = fields[6] as String
      ..statusRepeat = fields[7] as String
      ..day = (fields[8] as Map).cast<String, bool>()
      ..week = fields[9] as int
      ..month = fields[10] as int
      ..status = fields[11] as String
      ..timeReminders = (fields[12] as List).cast<String>()
      ..completeDay = (fields[13] as List).cast<dynamic>()
      ..currentStreaks = fields[14] as int
      ..longestStreaks = fields[15] as int;
  }

  @override
  void write(BinaryWriter writer, Habit obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.start)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.icon)
      ..writeByte(4)
      ..write(obj.goals)
      ..writeByte(5)
      ..write(obj.currentGoals)
      ..writeByte(6)
      ..write(obj.descGoals)
      ..writeByte(7)
      ..write(obj.statusRepeat)
      ..writeByte(8)
      ..write(obj.day)
      ..writeByte(9)
      ..write(obj.week)
      ..writeByte(10)
      ..write(obj.month)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.timeReminders)
      ..writeByte(13)
      ..write(obj.completeDay)
      ..writeByte(14)
      ..write(obj.currentStreaks)
      ..writeByte(15)
      ..write(obj.longestStreaks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
