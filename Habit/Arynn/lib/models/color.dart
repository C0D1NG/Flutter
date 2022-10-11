import 'package:flutter/material.dart';

ThemeData buildTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
		//colorScheme: _customColorScheme,
    toggleableActiveColor: toggleableActiveColor,
    primaryColor: darkBlueOne,
    scaffoldBackgroundColor: darkBlueOne, // done
		iconTheme: _customIconTheme(base.iconTheme),
		textTheme: _customTextTheme(base.textTheme), 
		timePickerTheme: _timePickerTheme,
  );
}

TextTheme _customTextTheme(TextTheme original){
	return original.copyWith(
			headline1: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
			headline2: TextStyle(color: Colors.white54, fontWeight: FontWeight.w500, fontSize: 14),
			headline3: TextStyle(color: darkBlueOne, fontWeight: FontWeight.w500, fontSize: 18),
			headline4: TextStyle(color: darkBlueOne, fontWeight: FontWeight.w500, fontSize: 12),
	);
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: darkBlueOne);
}

final _timePickerTheme = TimePickerThemeData(
  backgroundColor: darkBlueOne,

  hourMinuteShape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(color: Colors.lightBlueAccent, width: 1),
  ),
  //dayPeriodBorderSide: const BorderSide(color: Colors.orange, width: 4),
  dayPeriodColor: Colors.blueGrey.shade600,

	// border outside
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),

  dayPeriodTextColor: Colors.white,

  dayPeriodShape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    side: BorderSide(color: Colors.lightBlueAccent, width: 1),
  ),

  hourMinuteColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected) ? Colors.white : darkBlueOne),

  hourMinuteTextColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.selected) ? darkBlueOne : Colors.white),
	
	// center line
  dialHandColor: Colors.white,
	
	//center circle background
  dialBackgroundColor: darkBlueOne,

  hourMinuteTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

  dayPeriodTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),

  helpTextStyle:
      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),

	// decoration input time
  inputDecorationTheme: const InputDecorationTheme(
		enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1),borderRadius: BorderRadius.all(Radius.circular(10))),
		focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1),borderRadius: BorderRadius.all(Radius.circular(10))),
		errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1),borderRadius: BorderRadius.all(Radius.circular(10))),
		focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1),borderRadius: BorderRadius.all(Radius.circular(10))),
  ),

  dialTextColor: MaterialStateColor.resolveWith(
      (states) => states.contains(MaterialState.selected) ? darkBlueOne : Colors.white),
  entryModeIconColor: Colors.white,

);

const ColorScheme _customColorScheme = ColorScheme(
  primary: darkBlueOne,
  secondary: Colors.white,
  surface: Colors.white,
  background: Colors.pink,
  error: Colors.white,
  onPrimary: Colors.red,
  onSecondary: Colors.yellowAccent,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.dark,
);

const Color darkBlueOne = Color.fromRGBO(21, 21, 71, 1);
const Color textWhite = Colors.white;
const Color toggleableActiveColor = Colors.blue;
final iconsGradientColors = List<Color>.from(
      [Colors.yellowAccent, Colors.greenAccent, Colors.lightBlueAccent]);

	

const primaryGradient = LinearGradient(
	begin: Alignment.topLeft,
	end: Alignment.bottomRight,
	colors: [
		Colors.yellowAccent,
		Colors.greenAccent,
		Colors.lightBlueAccent,
	]
);
