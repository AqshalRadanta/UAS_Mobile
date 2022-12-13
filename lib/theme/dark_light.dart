import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static  SharedPreferences? pref;

  static init() async {
    return pref = await SharedPreferences.getInstance();
  }
}