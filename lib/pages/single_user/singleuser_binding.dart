import 'package:get/get.dart';
import 'package:reqres/pages/single_user/singleuser_api.dart';
import 'package:reqres/pages/single_user/singleuser_controller.dart';

class SingleUserBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SingleUserController>(() => SingleUserController(api: SingleUserApi()));
  }
}