import 'package:shared_preferences/shared_preferences.dart';

class TokenUtil {
  Future<bool> checkToken() async {
    SharedPreferences sPref = await SharedPreferences.getInstance();
    if(sPref.getString("token") != null){
      return true;
    }
    return false;
  }


  Future<String> getToken() async {
    final SharedPreferences sPref = await SharedPreferences.getInstance();
    final token = sPref.getString("token") ?? "";
    return token;
  }

  Future<bool> storeToken(String token) async {
    final SharedPreferences sPref = await SharedPreferences.getInstance();
    final tokenval = sPref.setString("token",token);
    return tokenval;
  }

  Future<bool> removeToken(String token) async {
    final SharedPreferences sPref = await SharedPreferences.getInstance();
    final tokenval = sPref.remove(token);
    return tokenval;
  }

}
