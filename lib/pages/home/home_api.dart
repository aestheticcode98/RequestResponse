import 'package:reqres/api/api1.dart';

class HomeApi {
  Future<dynamic> getData({required int page})async{
    var r = await Api1().apiJSONGet("api/users?page=$page");
    return r;
  }
}