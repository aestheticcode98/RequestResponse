import 'dart:developer';

import 'package:reqres/api/api1.dart';

class SingleUserApi {

  Future<dynamic> getSingleUser({
    required int id_user
  })async{
    var r = await Api1().apiJSONGet("api/users/$id_user");
    return r;
  }

  Future<dynamic> deleteSingleUser({
    required int id_user
  })async{
    var r = await Api1().apiJSONDelete("api/users/$id_user");
    return r;
  }

}