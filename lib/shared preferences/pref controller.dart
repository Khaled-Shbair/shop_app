import 'package:shared_preferences/shared_preferences.dart';

import '../models/login model.dart';

enum Keys {
  loggedIn,
  id,
  email,
  onBoarding,
  token,
  name,
  phone,
}

class PrefController {
  static final PrefController _prefController = PrefController._();
  late SharedPreferences _preferences;

  PrefController._();

  factory PrefController() {
    return _prefController;
  }

  Future<void> initPrefController() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveDataLogin({required Data value}) async {
    await _preferences.setBool(Keys.loggedIn.toString(), true);
    await _preferences.setString(Keys.token.toString(), value.token);
    await _preferences.setString(Keys.name.toString(), value. name);
    await _preferences.setString(Keys.phone.toString(), value.phone);
    await _preferences.setString(Keys.email.toString(), value.email);
    await _preferences.setInt(Keys.id.toString(), value.id);
  }

 // Future<void> saveDataLogin({required LoginModel? value}) async {
 //   await _preferences.setBool(Keys.loggedIn.toString(), true);
 //   await _preferences.setString(Keys.token.toString(), value!.data!.token);
 //   await _preferences.setString(Keys.name.toString(), value.data!.name);
 //   await _preferences.setString(Keys.phone.toString(), value.data!.phone);
 //   await _preferences.setString(Keys.email.toString(), value.data!.email);
 //   await _preferences.setInt(Keys.id.toString(), value.data!.id);
 // }

  bool get loggedIn => _preferences.getBool(Keys.loggedIn.toString()) ?? false;

  String get token => _preferences.getString(Keys.token.toString()) ?? 'token';
  String get name => _preferences.getString(Keys.name.toString()) ?? 'name';
  String get phone => _preferences.getString(Keys.phone.toString()) ?? 'phone';
  String get email => _preferences.getString(Keys.email.toString()) ?? 'email';

  Future<bool> clear() async => await _preferences.clear();

  Future<void> saveOnBoarding({required bool value}) async {
    await _preferences.setBool(Keys.onBoarding.toString(), value);
  }

  bool get onBoarding =>
      _preferences.getBool(Keys.onBoarding.toString()) ?? false;

  dynamic getData({required String key}) {
    return _preferences.get(key);
  }
}

/*

 Future<bool> saveData({required String key, required dynamic value}) async {
   if (value is String) return await _sharedPreferences.setString(key, value);
   if (value is int) return await _sharedPreferences.setInt(key, value);
   if (value is bool) return await _sharedPreferences.setBool(key, value);
   return await _sharedPreferences.setDouble(key, value);
  }
 */
