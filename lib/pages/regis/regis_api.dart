import 'package:reqres/api/api1.dart';

class RegisApi {

  Future<dynamic> regisUser ({
    required String email,
    required String password
  })async{

    final input = {
      "email" : email,
      "password" : password
    };

    var r = await Api1().apiJSONPost("api/register", input);
    return r;
  }

  Future<dynamic> loginUser ({
    required String email,
    required String password
  }) async {

    final input = {
      "email" : email,
      "password" : password
    };

    var r = await Api1().apiJSONPost("api/login", input);
    return r;
  }
}