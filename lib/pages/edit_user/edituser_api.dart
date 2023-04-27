import 'package:reqres/api/api1.dart';

class EditUserApi {
  Future<dynamic> editUser({
    required int id,
    required String name,
    required String job,
  })async{
    final input = {
      "name": name,
      "job" : job
    };
    
    var r = await Api1().apiJSONPut("api/users/$id", input);
    return r;
  }
}