import 'package:get/get.dart';

class IndexController extends GetxController {
  // 是否展示欢迎页
  var isloadWelcomePage = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    startCountdownTimer();
  }

  @override
  void onClose() {}

  // 展示欢迎页，倒计时1.5秒之后进入应用
  Future startCountdownTimer() async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      isloadWelcomePage.value = false;
    });
  }
}
