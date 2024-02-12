import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:starter/app/data/models/response/newsapi.dart';

import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
   HomeScreenView( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeScreenView is working ${(Get.arguments as Articles).source?.name ?? ''}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
