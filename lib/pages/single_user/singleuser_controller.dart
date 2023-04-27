import 'dart:developer';

import 'package:get/get.dart';
import 'package:reqres/pages/single_user/singleuser_api.dart';
import 'package:reqres/response/User.dart';

class SingleUserController extends GetxController{
  final SingleUserApi api;
  SingleUserController({required this.api});

  var loading = false.obs;
  var id_user = 0.obs;
  var singleUserResponse = User().obs;

  @override
  void onInit() {
    super.onInit();
    id_user.value = Get.arguments;
    singleUser();
  }

  singleUser()async{
    try{
      loading(true);
      var singleResponse = await api.getSingleUser(id_user: id_user.value);
      if(singleResponse["data"] != null){
        var details = singleResponse['data'];
        singleUserResponse.value = User.fromJson(details);
      }
      loading(false);
    }catch(e){
      log(e.toString());
    }
  }

  deleteData()async{
    try{
      var deleteResponse = await api.deleteSingleUser(id_user: id_user.value);
      Get.back();
    }catch(e){
      log(e.toString());
    }
  }
}