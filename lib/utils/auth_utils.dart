import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static SharedPreferences _sharedPreferences;

  static final String endPoint = '/users/login';
  // Keys to store and fetch data from SharedPreferences
  static final String authTokenKey = 'token';
  static final String authRefreshKey = 'refreshtoken';

  static Future<void> _init() async {
    _sharedPreferences = await _prefs;
  }

  static Future<String> getToken() async {
    await _init();
    return _sharedPreferences.getString(authTokenKey);
  }

  static setAuth(var response) async {
    await _init();
    _sharedPreferences.setString(authTokenKey, response[authTokenKey]);
    _sharedPreferences.setString(authRefreshKey, response[authRefreshKey]);
  }

  static Future<bool> authenticated() async {
    await _init();
    if (_sharedPreferences.getString(authTokenKey) != null) {
      return true;
    } else {
      return false;
    }
  }
  
  static Future clearData() async {
    await _sharedPreferences.setString(authTokenKey, null);
    await _sharedPreferences.setString(authRefreshKey, null);
  }
}
