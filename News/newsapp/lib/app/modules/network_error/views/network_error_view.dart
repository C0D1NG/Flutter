import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:starter/app/theme/app_colors.dart';

import '../controllers/network_error_controller.dart';

class NetworkErrorView extends GetView<NetworkErrorController> {
  const NetworkErrorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('NetworkErrorView'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Column(children: [
            const Icon(Icons.error_outline_sharp,size: 300,),
          const  Text(
              'No Internet Connection!',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor
            ),onPressed: (){}, child: const Text('Try again',style: TextStyle(color: Colors.white),))
          ],),
        ),
      )
    );
  }
}
