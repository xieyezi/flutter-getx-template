import 'package:flutter/material.dart';
import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
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
