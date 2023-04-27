import 'package:get/get.dart';
import 'package:reqres/pages/regis/regis_api.dart';
import 'package:reqres/pages/regis/regis_controller.dart';

class RegisBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisController>(() => RegisController(api: RegisApi()));
  }
}