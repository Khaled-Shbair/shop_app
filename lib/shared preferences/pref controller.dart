import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> saveLogin({required bool value}) async {
    await _preferences.setBool(Keys.loggedIn.toString(), value);
  }

  Future<void> saveToken({required String token}) async {
    await _preferences.setString(Keys.token.toString(), token);
  }

  bool get loggedIn => _preferences.getBool(Keys.loggedIn.toString()) ?? false;

  String get token => _preferences.getString(Keys.token.toString()) ?? 'token';

  Future<void> saveOnBoarding({required bool value}) async {
    await _preferences.setBool(Keys.onBoarding.toString(), value);
  }

  bool get onBoarding =>
      _preferences.getBool(Keys.onBoarding.toString()) ?? false;
}
