import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  String userName = 'burnish';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;

  void changeUserName() {
    userName = 'juefei';
    update();
  }
}
