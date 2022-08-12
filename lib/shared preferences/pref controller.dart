import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { id, password, email, login, onBoarding }

class PrefController {
  static final PrefController _prefController = PrefController._();
  late SharedPreferences _sharedPreferences;

  PrefController._();

  factory PrefController() {
    return _prefController;
  }

  Future<void> initPrefController() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //Future<bool> saveData({required String key, required dynamic value}) async {
  //  if (value is String) return await _sharedPreferences.setString(key, value);
  //  if (value is int) return await _sharedPreferences.setInt(key, value);
  //  if (value is bool) return await _sharedPreferences.setBool(key, value);
  //  return await _sharedPreferences.setDouble(key, value);
  //}
  Future<void> saveOnBoarding({required bool value}) async {
    await _sharedPreferences.setBool(PrefKeys.onBoarding.toString(), value);
  }

  bool get getOnBoarding =>
      _sharedPreferences.getBool(PrefKeys.onBoarding.toString()) ?? false;

  dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }
}
