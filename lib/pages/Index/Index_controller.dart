import 'package:get/get.dart';

class IndexController extends GetxController {
  // 是否展示欢迎页
  bool isloadWelcomePage = true;

  @override
  void onInit() {
    startCountdownTimer();
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  // 展示欢迎页，倒计时1.5秒之后进入应用
  Future startCountdownTimer() async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      isloadWelcomePage = false;
    });
  }
}
