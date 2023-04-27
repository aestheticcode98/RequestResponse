import 'package:get/get.dart';
import 'package:reqres/pages/add_user/adduser_api.dart';
import 'package:reqres/pages/add_user/adduser_controller.dart';

class AddUserBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddUserController>(() => AddUserController(api: AddUserApi()));
  }
}