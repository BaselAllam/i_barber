import 'package:shared_preferences/shared_preferences.dart';


Future<void> saveLocal() async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool('isLogedIn', true);
}


Future<bool> getLocal() async {

  try {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? i = sharedPreferences.getBool('isLogedIn');
    if (i!) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}


Future<void> clearLocal() async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.clear();
}