import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static setItem(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var func;
    if (value is String) {
      func = prefs.setString;
    }
    if (value is int) {
      func = prefs.setInt;
    }

    await func(key, value);
  }

  static getItem(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static removeItem(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
