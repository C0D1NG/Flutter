import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:starter/app/data/values/strings.dart';

class CustomError extends StatelessWidget {
  const CustomError({
    Key? key,
    this.errorDetails,
  }) : super(key: key);

  final FlutterErrorDetails? errorDetails;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Icon(
                Icons.error_outline_rounded,
                size: 80,
                color: Colors.red,
              ),
              const Text(
                ErrorMessages.networkGeneral,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text(
                  Strings.goBack,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
