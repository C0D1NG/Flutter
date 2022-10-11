import 'package:flutter/material.dart';
import 'package:my_habit/controllers/habitcontroller.dart';
import 'package:my_habit/models/color.dart';
import 'package:my_habit/models/habit.dart';
import 'package:my_habit/provider/data_habits_provider.dart';
import 'package:my_habit/widget/dialogicons.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class OneTaskBottomSheet extends StatelessWidget {
	final controller = Get.put(HabitController());
	OneTaskBottomSheet({Key? key, this.habit}) : super(key: key);
	Habit? habit;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HabitController>(
			initState: (_){
			if(habit != null){
						controller.setToUpdate(habit!, "oneTask");
					}else{
						controller.clearDatahabit();
					}
			},
				init: HabitController(),
			  builder: (controller) => Container(
        height: MediaQuery.of(context).size.height * 0.97,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "One Task",
                        style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Creating a new One Task",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {
												if(controller.nameHabitController.text.isNotEmpty){
													if(habit != null){
														controller.updateHabit(habit!);
													}else{
														controller.addHabit("oneTask");
													}
													Navigator.pop(context);
												}else{
													controller.setStatusInput(false);
												}

			  							},
                      icon: ShaderMask(
                          shaderCallback: (rect) =>
                              primaryGradient.createShader(rect),
                          child: const Icon(
                            Icons.done_all_rounded,
                            color: Colors.white,
                          ))),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  TextField(
                    controller: controller.nameHabitController,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: "Name your One Task",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 15.0,
                      ),
                      suffixIcon: controller.statusInput
                          ? null
                          : const Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    child: Container(
                      height: 1.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(gradient: primaryGradient),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return  DialogIcons();
											});
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShaderMask(
                          shaderCallback: (rect) =>
                              primaryGradient.createShader(rect),
                          child: Icon(
                            controller.iconHabit,
                            color: Colors.white,
                            size: 34,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Change Icon",
                        style: Theme.of(context).textTheme.headline1,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.getDatePicker(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Row(
                    children: [
                      ShaderMask(
                          shaderCallback: (rect) =>
                              primaryGradient.createShader(rect),
                          child: Icon(
                            Icons.event_rounded,
                            color: Colors.white,
                            size: 34,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        controller.dateTime,
                        style: Theme.of(context).textTheme.headline1,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Get Reminders',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Switch(
                      value: controller.statusSwitchReminders,
                      onChanged: (value) {
												controller.setStatusSwicthReminder(value);
												if(!controller.statusSwitchReminders){
			  									controller.listTime.clear();
			  								}

                       // setState(() {
                       //   statusSwitchReminders = value;
			  							//		if(!statusSwitchReminders){
			  							//			listTime.clear();
			  							//		}
                      //  });
                      })
                ],
              ),
              Visibility(
                visible: controller.statusSwitchReminders,
                child: Column(
                  children: [
                    for (int i = 0; i < controller.listTime.length; i++)
                      ListTile(
                        leading: SizedBox(
                          height: double.infinity,
                          child: Icon(
                            Icons.access_time_rounded,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        title: Text(
                          controller.listTime[i],
                          style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
			  								trailing: SizedBox(
			  									height: double.infinity, 
			  									child: IconButton(
			  										onPressed:(){
															controller.deleteListTime(i);
			  										}, 
			  										icon:Icon(Icons.close_rounded, color: Colors.white,),)),
                        minLeadingWidth: 0,
                      ),
                    ListTile(
			  							onTap: (){
			  								controller.selectTime(context);
			  							},
                      leading: Container(
                        height: double.infinity,
                        child: Icon(
                          Icons.add_circle_rounded,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      title: Text(
                        "Add reminder time",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      minLeadingWidth: 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
