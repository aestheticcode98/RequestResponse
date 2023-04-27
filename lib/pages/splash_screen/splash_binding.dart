import 'package:get/get.dart';
import 'package:reqres/pages/splash_screen/splash_controller.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}