import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/global.dart';
import 'package:flutter_getx_template/pages/home/home_view.dart';
import 'package:flutter_getx_template/pages/login/login_view.dart';
import 'package:flutter_getx_template/pages/splash/spalsh_view.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // 是否展示欢迎页
  bool _isloadWelcomePage = true;

  @override
  void initState() {
    // MyNavigator.ctx = context; // 此处保留context
    startCountdownTimer();
    super.initState();
  }

  // 展示欢迎页，倒计时1.5秒之后进入应用
  Future startCountdownTimer() async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _isloadWelcomePage = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isloadWelcomePage
          ? SplashPage()
          : Global.isOfflineLogin
              ? HomePage()
              : LoginPage(),
    );
  }
}
