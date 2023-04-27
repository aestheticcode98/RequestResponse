import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reqres/api/api2.dart';
import 'package:reqres/pages/regis/regis_api.dart';
import 'package:reqres/routing/routing_names.dart';

class RegisController extends GetxController{
  final RegisApi api;
  RegisController ({required this.api});

  var edtUsername = TextEditingController();
  var edtPassword = TextEditingController();

  var showPass = true.obs;
  final formkeyRegis = GlobalKey<FormState>();

  @override
  void onClose() {
    super.onClose();
    edtUsername.dispose();
    edtPassword.dispose();
  }

  validator(){
    if(formkeyRegis.currentState!.validate()){
      if(edtUsername.text.isNotEmpty && edtPassword.text.isNotEmpty){
        regisuser();
      }else{
        Get.snackbar(
            "Input",
            "Please check the input",
          snackPosition: SnackPosition.BOTTOM
        );
      }
    }
  }

  regisuser()async{
    try{
      var regisResponse = await api.regisUser(
          email: edtUsername.text,
          password: edtPassword.text
      );
      if(regisResponse["id"] != 0){
        await Api2().setUserId(user: regisResponse["id"]);

        var autoLogin = await api.loginUser(
            email: edtUsername.text,
            password: edtPassword.text
        );
        if(autoLogin["token"] != null || autoLogin["token"] != ""){
          await Api2().setIsLogin(isLogin: true);
          await Api2().setToken(token: autoLogin["token"]);
          Get.offAllNamed(Routes.home);
        }else{
          Get.snackbar(
              "Register User",
              autoLogin["error"]
          );
        }
      }else{
        Get.snackbar(
            "Register User",
            regisResponse["error"]
        );
      }
    }catch(e){
      log(e.toString());
    }
  }
}