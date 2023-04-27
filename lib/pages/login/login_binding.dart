import 'package:get/get.dart';
import 'package:reqres/pages/login/login_controller.dart';
import 'package:reqres/pages/login/login_api.dart';

class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(api: LoginApi()));
  }
}