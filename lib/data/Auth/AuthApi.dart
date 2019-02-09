import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApi {
  AuthApi();

  //submitLogin
  Future<Object> login(String username, String password) async {
    try {
      final response = await http.post('http://10.0.2.2:4000/api/fpllogin',
          body: {
            "username": username,
            "password": password
          }).timeout(Duration(seconds: 60));

      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        print(response.body);
        throw Exception(response.body);
      }
    } catch (e) {
      print(e.toString());
      String err =
          '{"status": 0,"error": "Connection Error - Please try again"}';
      return err;
    }
  }
}

//      print(response.body);
//      var jsonObj = json.decode(response.body);
//      print(jsonObj["status"]);