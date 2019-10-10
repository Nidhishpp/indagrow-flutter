import '../utils/network_utils.dart';
import 'dart:convert';

class APIRoutes {
  static dynamic login(String _email, String _password) async {
    Map data = {'number': _email, 'password': _password};
    return await NetworkUtils.authenticateUser(
      "/users/login",
      data,
    );
  }

  static dynamic register(
      String _email,
      String _password,
      var _name,
      var _dob,
      var _addressline,
      var _landmark,
      var _city,
      var _state,
      var _country,
      var _postalcode) async {
    Map data = {
      'number': _email,
      'name': _name,
      'password': _password,
      'dob': _dob,
      'address': {
        "address_line": _addressline,
        "landmark": _landmark,
        "city": _city,
        "state": _state,
        "country": _country,
        "postal_code": _postalcode
      }
    };

    return await NetworkUtils.insert(
      '/users/',
      json.encode(data),
    );
  }

  static dynamic submitClue(String _qrcode) async {
    Map data = {
      'qr_code': _qrcode,
    };

    return await NetworkUtils.insert(
      '/api/clue',
      json.encode(data),
    );
  }

  static dynamic submitActivity() async {
    Map data = {
      'code': "200",
    };

    return await NetworkUtils.insert(
      '/api/activity',
      json.encode(data),
    );
  }

  static dynamic getUser() async {
    return await NetworkUtils.fetch("/users");
  }

  static dynamic getFeed() async {
    return await NetworkUtils.fetch("/forums/");
  }

  static dynamic getActivity() async {
    return await NetworkUtils.fetch("/api/activity");
  }
}
