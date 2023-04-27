import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reqres/pages/home/home_api.dart';
import 'package:reqres/response/User.dart';

class HomeController extends GetxController{
  final HomeApi api;
  HomeController({required this.api});

  var page = 1.obs;
  var loading = false.obs;
  var secondLoading = false.obs;
  RxList<User> allUser = <User>[].obs;
  RxList<User> extendDataUser = <User>[].obs;
  ScrollController scroller = ScrollController();


  @override
  void onInit() {
    super.onInit();
    getListUser();
    scroller.addListener(() async{
      if(scroller.position.pixels <= scroller.position.maxScrollExtent){
        secondLoading(true);
        await getMoreUser(++page.value);
        secondLoading(false);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    scroller.dispose();
  }

  getListUser() async {
    try {
      loading(true);
      allUser.clear();
      extendDataUser.clear();
      var userResponse = await api.getData(page: page.value);
      if (userResponse != null) {
        List<dynamic> listDetail = userResponse["data"];
        allUser(RxList<User>.from(
            listDetail.map((e) => User.fromJson(e))));
      }
      loading(false);
    } catch (e) {
      log(e.toString());
    }
  }

  getMoreUser(int page)async{
    try{
      var  moreUserResponse= await api.getData(page: page);
      if (moreUserResponse != null) {
        List<dynamic> listDetail = moreUserResponse["data"];
        extendDataUser.clear();
        extendDataUser(RxList<User>.from(
            listDetail.map((e) => User.fromJson(e))));
        allUser.addAll(extendDataUser);
      }
    }catch(e){
      log(e.toString());
    }
  }
}