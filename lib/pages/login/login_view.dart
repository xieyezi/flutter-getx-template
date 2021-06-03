import 'package:flutter/material.dart';
import 'package:flutter_getx_template/pages/login/login_controller.dart';
import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.offAndToNamed(AppRoutes.Home),
        child: Container(
          child: Center(
            child: Text('登录页'),
          ),
        ),
      ),
    );
  }
}
