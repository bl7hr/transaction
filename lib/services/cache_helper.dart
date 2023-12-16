import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
static saveData({required String key,required dynamic value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (value is String) return await prefs.setString(key, value);
  if (value is bool) return await prefs.setBool(key, value);
  if (value is int) return await prefs.setInt(key, value);
  return await prefs.setDouble(key, value);
}
static removeData({required String key})async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}
getDataString({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}
getDataInt({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt(key);
}
getDataBool({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}
getDataDouble({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}
}