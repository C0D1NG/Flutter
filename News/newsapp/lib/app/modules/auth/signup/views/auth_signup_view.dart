import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:starter/app/modules/auth/signup/controllers/auth_signup_controller.dart';

class AuthSignupView extends GetView<AuthSignupController> {
  const AuthSignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthSignupView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AuthSignupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
