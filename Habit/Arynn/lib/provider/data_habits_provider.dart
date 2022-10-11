import 'package:flutter/material.dart';

class DataHabitsProvider extends ChangeNotifier{
	
	List<IconData> _dataHabits = [];

	void addDatahabits(IconData data){
		_dataHabits.add(data);
		notifyListeners();
	}
	
	List<IconData> get listDataHabits => _dataHabits;

}
