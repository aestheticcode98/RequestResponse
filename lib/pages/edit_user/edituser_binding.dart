import 'package:get/get.dart';
import 'package:reqres/pages/edit_user/edituser_api.dart';
import 'package:reqres/pages/edit_user/edituser_controller.dart';

class EditUserBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditUserController>(() => EditUserController(api: EditUserApi()));
  }
}