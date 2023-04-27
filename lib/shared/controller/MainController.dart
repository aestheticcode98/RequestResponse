import 'package:get/get.dart';
import 'package:reqres/pages/splash_screen/splash_controller.dart';

class MainController extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}