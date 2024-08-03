import 'package:shared_preferences/shared_preferences.dart';

mixin CacheManager {
  saveString(String key, String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  Future<String?> getString(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  saveInt(String key, int value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(key, value);
  }
  getInt(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(key);
  }

  saveBool(String key, bool value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(key, value);
  }
  getBool(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(key);
  }

  removeString(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  clearPref() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}

enum CMEnum {
  token,
  role,
}
