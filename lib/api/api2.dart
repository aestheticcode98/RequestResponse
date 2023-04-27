import 'package:get_storage/get_storage.dart';

const String CACHE_USERID = 'userid';
const String CACHE_TOKEN = 'token';
const String CHECK_LOGIN = "loginState";

class Api2{
  final local = GetStorage();

  //set get user_id
  Future setUserId({int? user}) async {
    user ??= 0;
    await local.write(CACHE_USERID, user);
  }
  Future<dynamic> getUserId() async {
    return local.read(CACHE_USERID);
  }

  //set get token
  Future setToken({String? token}) async {
    token ??= "";
    await local.write(CACHE_TOKEN, token);
  }
  Future<String?> getToken() async {
    return local.read(CACHE_TOKEN);
  }

  //set get status login
  Future setIsLogin({bool? isLogin}) async {
    isLogin ??= false;
    await local.write(CHECK_LOGIN, isLogin);
  }
  Future<bool?> getLoginStatus() async {
    return local.read(CHECK_LOGIN);
  }


  Future removeStorageForLogout() async {
    await local.remove(CACHE_USERID);
    await local.remove(CACHE_TOKEN);
    await local.remove(CHECK_LOGIN);
  }

}