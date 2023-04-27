import 'package:get/get.dart';
import 'package:reqres/api/api2.dart';
import 'package:reqres/routing/routing_names.dart';

class SplashController extends GetxController{

  @override
  void onInit() async {
    splashAnimation();
    super.onInit();
  }

  splashAnimation() async {
    await Future.delayed(const Duration(seconds: 3));
    var statusLogin = await Api2().getLoginStatus();
    if (statusLogin == true) {
      Get.offNamed(Routes.home);
    } else {
      Get.offNamed(Routes.login);
    }
  }

}