import 'package:flutter/material.dart';
import 'package:my_habit/controllers/habitcontroller.dart';
import 'package:my_habit/data.dart';
import 'package:my_habit/models/color.dart';
import 'package:get/get.dart';

class DialogIcons extends StatelessWidget {
  final bankIcons = DataHabits.bankIcon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
			backgroundColor: darkBlueOne,
        title: Text("Choose Icon"),
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        content: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < bankIcons.length; i++)
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ShaderMask(
                      shaderCallback: (rect) =>
                          primaryGradient.createShader(rect),
                      child: IconButton(
                        onPressed: () {
												Get.find<HabitController>().setIconHabit(bankIcons[i]);	
                         Navigator.pop(context);
                        },
                        icon: Icon(
                          bankIcons[i],
                          size: 36,
                        ),
                        color: Colors.white,
                      )),
                ),
            ],
          ),
        ),
    );
  }
}
