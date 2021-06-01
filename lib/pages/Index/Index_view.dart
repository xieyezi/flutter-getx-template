import 'package:flutter/material.dart';
import 'package:flutter_getx_template/global.dart';
import 'package:flutter_getx_template/pages/Index/Index_controller.dart';
import 'package:flutter_getx_template/pages/home/home_view.dart';
import 'package:flutter_getx_template/pages/login/login_view.dart';
import 'package:flutter_getx_template/pages/splash/spalsh_view.dart';
import 'package:get/get.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (controller) {
      return Scaffold(
        body: controller.isloadWelcomePage
            ? SplashPage()
            : Global.isOfflineLogin
                ? HomePage()
                : LoginPage(),
      );
    });
  }
}
