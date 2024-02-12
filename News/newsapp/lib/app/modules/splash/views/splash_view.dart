import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:starter/app/modules/new_home/views/new_home_view.dart';

import 'package:starter/app/modules/splash/controllers/splash_controller.dart';
import 'package:starter/app/theme/app_colors.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.newspaper_rounded,
          size: 350,
          color: Colors.white,
        ),
        Center(
          child: Text(
            'MyNews',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: 10),
          ),
        ),
      ],
    ));
  }
}
