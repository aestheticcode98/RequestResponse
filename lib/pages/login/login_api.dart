import 'package:reqres/api/api1.dart';

class LoginApi {

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