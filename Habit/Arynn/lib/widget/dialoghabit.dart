import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_habit/controllers/datecontroller.dart';
import 'package:my_habit/models/color.dart';
import 'package:my_habit/models/habit.dart';
import 'package:my_habit/pages/detail_habit_page.dart';
import 'package:my_habit/widget/boxes.dart';
import 'package:my_habit/widget/onetask_bottomsheet.dart';
import 'package:my_habit/widget/regulerhabit_bottomsheet.dart';
import 'package:get/get.dart';


class DialogHabit extends StatelessWidget{
  DialogHabit({Key? key, required this.habit, required this.today}) : super(key: key);

	Habit habit;	
	bool today;


	final dateController = Get.find<DateController>();

	int getIndexCompleteDay(){
		print("current di dialog ${dateController.currentDateTime}");
		for(int i = 0; i < habit.completeDay.length; i++){
				print("masuk di dalam loop getIndex");
			if(habit.completeDay[i]["day"] == dateController.currentDateTime.day && habit.completeDay[i]["month"] == dateController.currentDateTime.month && habit.completeDay[i]["year"] == dateController.currentDateTime.year){
				print("masuk di dalam IF getIndex");
				return i;
			}
		}
		print("SUDAH MASUKK");
		return 0;
	}


	bool checkLoopingCompleteDay() {
		for(int i = 0; i < habit.completeDay.length; i++){
			if(habit.completeDay[i]["day"] == dateController.dateToday.day && habit.completeDay[i]["month"] == dateController.dateToday.month && habit.completeDay[i]["year"] == dateController.dateToday.year){
				updateCompleteDayItems(i);
				return false;
			}
		}
		return true;
	}

	void addCompleteDayItems(){
		print("MASUK ke TAMBAH COMPLETE COKKKKKK");
		habit.completeDay.add({
			"day": dateController.dateToday.day,
			"month": dateController.dateToday.month,
			"year": dateController.dateToday.year,
			"finishGoals": habit.currentGoals,
			"goals": habit.goals,
		});
	}
	void updateCompleteDayItems(int index){
		print("=============== JUANCOKKKKKKK =================");
		print(habit.completeDay[index]["day"]);
		habit.completeDay[index]["day"] = dateController.dateToday.day;
		habit.completeDay[index]["month"] = dateController.dateToday.month;
		habit.completeDay[index]["year"] = dateController.dateToday.year;
		habit.completeDay[index]["finishGoals"] = habit.currentGoals;
		habit.completeDay[index]["goals"] = habit.goals;
	}


	@override
	  Widget build(BuildContext context) {
			var width = MediaQuery.of(context).size.width;
			var height = MediaQuery.of(context).size.height;

		 return ValueListenableBuilder(
			 valueListenable: Boxes.getHabit().listenable(),
		   builder: (context, habitList, _){
				 //Habit habit = habitList.getAt(0);
				 print("INI HABIT = ${habit.title}");
				 return AlertDialog(
			insetPadding: EdgeInsets.symmetric(vertical: height * .1, horizontal: width * .05),
			alignment: Alignment.topCenter,
			contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
			shape: const RoundedRectangleBorder(
					borderRadius: BorderRadius.all(Radius.circular(30))
				),
			backgroundColor: Colors.black.withOpacity(.7),
          content: SizedBox(
						height: height *.22,
						width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
																dateController.updateCurrentMonthList(DateTime.now());
																Get.to(DetailHabit(habit: habit,));
															},
                              icon: const Icon(
                                Icons.info_outline_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              constraints: const BoxConstraints(),
                            ),
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    backgroundColor: darkBlueOne,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(35))),
                                    builder: (context) {
                                      return habit.type == "reguler" ? RegulerHabitBottomSheet(habit: habit, indexCompleteDay: getIndexCompleteDay()) : OneTaskBottomSheet(habit: habit,);
                                    });
                              },
                              icon: const Icon(
                                Icons.edit_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              constraints: const BoxConstraints(),
                            ),
                            IconButton(
                              onPressed: () {
																habit.delete();
																Navigator.pop(context);
															},
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              constraints: const BoxConstraints(),
                            ),
                            IconButton(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                constraints: const BoxConstraints(),
                                onPressed: () {
																	//habit.completeDay.removeAt(2);
																	Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                  size: 20,
                                )),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(
													//Icons.menu_book_rounded,
                          IconData(habit.icon, fontFamily: "MaterialIcons"),
                          color: Colors.white,
                          size: 32,
                        ),
                        title: Text(
                          habit.title,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Row(children: [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Got for it!",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          )
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Do Anytime",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            Text(
															// if today return status, if last return done, if future return active
                             dateController.dateToday.day == dateController.currentDateTime.day ? habit.status : dateController.dateToday.day > dateController.currentDateTime.day ? "done" : "active",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
																		// if today return currentGoals, if last return finishGoals, if future return 0
                                    habit.descGoals == "times" ? "${today ? habit.type != "oneTask" ?  habit.currentGoals : habit.completeDay.isEmpty ? 0 : habit.completeDay[getIndexCompleteDay()]["finishGoals"].toString() : dateController.currentDateTime.day < dateController.dateToday.day ? habit.completeDay.isEmpty ? 0 : habit.completeDay[getIndexCompleteDay()]["day"] == dateController.currentDateTime.day ? habit.completeDay[getIndexCompleteDay()]["finishGoals"].toString() : 0  : 0 } / ${today ? habit.goals : dateController.currentDateTime.day < dateController.dateToday.day ? habit.completeDay.isEmpty ? habit.goals : habit.completeDay[getIndexCompleteDay()]["day"] == dateController.currentDateTime.day ? habit.completeDay[getIndexCompleteDay()]["goals"].toString() : habit.goals : habit.goals}" : "${habit.goals}",
																		//"0/3",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    habit.descGoals,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )
                                ]),
														SizedBox(
															child: today ?
															Row(
                              children: [
                                IconButton(
                                  onPressed: () {
																		if(habit.status == "active"){
																			habit.status = "skip";
																			habit.currentGoals = 0;
																		}else if(habit.status == "done"){
																			habit.currentGoals = 0;
																			habit.status = "skip";
																		}else{
																			habit.status = "active";
																		}
																		checkLoopingCompleteDay();
																		habit.save();
																	},
                                  icon: Icon(
                                    habit.status == "active" || habit.status == "done" ?  Icons.pause_rounded : Icons.play_arrow_rounded,
																		color: Colors.white,
                                    size: 20,
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  constraints: const BoxConstraints(),
                                ),
																IconButton(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    constraints: const BoxConstraints(),
                                    onPressed: () {
																			if(habit.currentGoals == habit.goals || habit.status == "minutes"){
																				habit.currentGoals = 0;
																				habit.status = "active";
																				checkLoopingCompleteDay();
																				habit.save();
																			}
																		},
                                    icon: const Icon(
                                      Icons.replay_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                                IconButton(
                                  onPressed: () {
																		if(habit.currentGoals < habit.goals || habit.descGoals == "minutes" && habit.status != "done"){
																			habit.currentGoals = habit.goals;
																			habit.status = "done";
																			if(checkLoopingCompleteDay()){
																				addCompleteDayItems();
																			}
																			habit.save();
																		}
																	},
                                  icon: const Icon(
                                    Icons.done_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  constraints: const BoxConstraints(),
                                ),
																SizedBox(
																	child: habit.descGoals == "times" ?
																		Row(
																			children: [
																				IconButton(
                                  onPressed: () {
																		if(habit.currentGoals != 0 && habit.currentGoals <= habit.goals && habit.descGoals == "times"){
																			habit.currentGoals--;
																			habit.status = "active";
																			checkLoopingCompleteDay();
																			habit.save();
																		}
																	},
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  constraints: const BoxConstraints(),
                                ),
                                IconButton(
                                  onPressed: () {
																		if(habit.currentGoals < habit.goals && habit.descGoals == "times"){
																			habit.currentGoals++;
																			if(habit.currentGoals == habit.goals){
																				habit.status = "done";
																			//Navigator.pop(context);
																			}else if(habit.status == "skip"){
																				habit.status = "active";
																			}

																			// to add item in list completeDay
																			if(checkLoopingCompleteDay()){
																				addCompleteDayItems();
																			}

																			habit.save();
																		}
																	},
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  padding:const EdgeInsets.symmetric(horizontal: 2),
                                  constraints: const BoxConstraints(),
                                ),

																			],
																		) : null,
																),
                                
                              ],
                            ) : null,
														),
                          ],
                        ),


                        ),
                    ],
                  ),
						)
          );
			 }
		 );

	  }
}
