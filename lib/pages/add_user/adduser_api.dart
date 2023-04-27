import 'package:reqres/api/api1.dart';

class AddUserApi{
  Future<dynamic> newUser ({
    required String name,
    required String job
  })async{
    final input = {
      "name" : name,
      "job" : job
    };
    
    var r = await Api1().apiJSONPost("api/users", input);
    return r;
  }
}