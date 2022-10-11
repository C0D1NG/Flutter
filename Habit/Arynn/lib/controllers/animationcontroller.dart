import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationControllerHabit extends GetxController with GetTickerProviderStateMixin{
	late AnimationController animationControllerBottomSheet;
  late AnimationController animationController;
  late Animation<double> animation;


  void getAnimation(int timeDuration) {
    animationController = AnimationController(
        vsync: this, duration: Duration(seconds: timeDuration))
      ..forward();
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
  }

	@override
	  void onInit() {
		animationControllerBottomSheet = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
			print("ANIMATIONCONTROLLER CREATE");
	    super.onInit();
	  }
	
	@override
	  void dispose() {
			animationController.dispose();
			animationControllerBottomSheet.dispose();
			print("ANIMATIONCONTROLLER DISPOSEE");
	    super.dispose();
	  }

}
