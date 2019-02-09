import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  Future<bool> add(String name,String value) async {
    SharedPreferences sPref = await SharedPreferences.getInstance();
    final pref = sPref.setString(name,value);
    return pref;
  }

  Future<String> get(String name) async {
    SharedPreferences sPref = await SharedPreferences.getInstance();
    final pref = sPref.getString(name) ?? "";
    return pref;
  }

  Future<bool> remove(String name) async {
    SharedPreferences sPref = await SharedPreferences.getInstance();
    final pref = sPref.remove(name);
    return pref;
  }
}