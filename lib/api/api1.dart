import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:reqres/api/api2.dart';

class Api1 {
  String baseUrl = 'https://reqres.in/';

  Future<dynamic> apiJSONGet(String url) async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    log('headers = $headers');
    log('url = $baseUrl$url');

    http.Response r =
    await http.get(Uri.parse(baseUrl + url), headers: headers);
    log("status codenya ${r.statusCode}");
    log(r.body.toString());
    var data = json.decode(r.body);
    // log(data.toString());
    // logApi(url: url, res: r, method: "GET");
    return data;
  }

  Future<dynamic> apiJSONPost(String url, Map<String, dynamic> params) async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    log('headers = $headers');
    log('url = $baseUrl$url');

    var r = await http.post(Uri.parse(baseUrl + url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(params),
        encoding: Encoding.getByName("utf-8"));
    var data = jsonDecode(r.body);
    log("status codenya ${r.statusCode}");

    // log(data.toString());
    // logApi(url: url, res: r, method: "POST", payload: params);
    return data;
  }

  Future<dynamic> apiJSONPut(String url, Map<String, dynamic> params) async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    log('headers = $headers');
    log('url = $baseUrl$url');

    var r = await http.put(Uri.parse(baseUrl + url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(params),
        encoding: Encoding.getByName("utf-8"));
    var data = jsonDecode(r.body);
    log("status codenya ${r.statusCode}");

    // log(data.toString());
    // logApi(url: url, res: r, method: "PUT", payload: params);
    return data;
  }

  Future<dynamic> apiJSONDelete(String url) async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    log('headers = $headers');
    log('url = $baseUrl$url');

    var r = await http.delete(Uri.parse(baseUrl + url),
        headers: {"Content-Type": "application/json"});
    if (r.statusCode == 204) {
      return {"success": true};
    } else {
      var error = jsonDecode(r.body);
      log("status codenya ${r.statusCode}, error: $error");
      throw Exception("Failed to delete data");
    }
  }


  Future<dynamic> apiJSONGetWitToken(String url) async {
    var token = await Api2().getToken();
    Map<String, String> headers = {
      'content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    log('headers = ' + headers.toString());
    log('url = $baseUrl' + url);

    http.Response r =
    await http.get(Uri.parse(baseUrl + url), headers: headers);
    log("status codenya " + r.statusCode.toString());

    var data = json.decode(r.body);
    // log(data.toString());
    // logApi(url: url, res: r, method: "GET");
    return data;
  }

  Future<dynamic> apiJSONPostWithToken(String url, Map<String, dynamic> params) async {
    var token = await Api2().getToken();

    Map<String, String> headers = {
      'content-Type': 'application/json',
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    log('headers = ' + headers.toString());
    log('url = $baseUrl' + url);

    var r = await http.post(Uri.parse(baseUrl + url),
        headers: headers,
        body: jsonEncode(params),
        encoding: Encoding.getByName("utf-8"));
    var data = jsonDecode(r.body);
    log("status codenya " + r.statusCode.toString());

    // log(data.toString());
    // logApi(url: url, res: r, method: "POST", payload: params);
    return data;
  }

}