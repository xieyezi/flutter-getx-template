import 'package:flutter/material.dart';
import 'package:flutter_getx_template/global.dart';
import 'package:flutter_getx_template/pages/Index/Index_controller.dart';
import 'package:flutter_getx_template/pages/home/home_view.dart';
import 'package:flutter_getx_template/pages/login/login_view.dart';
import 'package:flutter_getx_template/pages/splash/spalsh_view.dart';
import 'package:get/get.dart';

class IndexPage extends GetView<IndexController> {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: controller.isloadWelcomePage.isTrue
              ? SplashPage()
              : Global.isOfflineLogin
                  ? HomePage()
                  : LoginPage(),
        ));
  }
}
