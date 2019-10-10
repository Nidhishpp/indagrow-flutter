import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'auth_utils.dart';

class NetworkUtils {
  static String _authToken;
  static String _host = 'http://68.183.92.248';

  static dynamic authenticateUser(String _endPoint, var data) async {
    var responseJson;
    try {
      final response = await http.post(
        _host + _endPoint,
        body: data,
      );
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
        var responseHeader = response.headers;
        await AuthUtils.setAuth(responseHeader);
      } else {
        responseJson = {
          'status': 'error',
          'message': 'Error Logging in',
        };
      }
      return responseJson;
    } catch (exception) {
      if (exception.toString().contains('SocketException')) {
        responseJson = {
          'status': 'error',
          'message': 'Network Error',
        };
      } else {
        responseJson = {
          'status': 'error',
          'message': 'Some Error Occurred',
        };
      }
      return responseJson;
    }
  }

  static fetch(String _endPoint) async {
    var responseJson;
    await _init();
    try {
      final response = await http.get(
        _host + _endPoint,
        headers: {
          'token': _authToken,
          'refreshtoken': _authToken,
          'Accept': 'application/json',
        },
      );
      print(response.body.toString());
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
      } else if (response.statusCode == 401) {
        responseJson = {
          'status': 'error',
          'type': 'unauthenticated',
          'message': 'Error Occurred',
        };
      } else {
        responseJson = {
          'status': 'error',
          'message': 'Error Occurred',
        };
      }
      return responseJson;
    } catch (exception) {
      if (exception.toString().contains('SocketException')) {
        responseJson = {
          'status': 'error',
          'message': 'Network Error',
        };
      } else {
        responseJson = {
          'status': 'error',
          'message': 'Some Error Occurred',
        };
      }
      return responseJson;
    }
  }

  static insert(String _endPoint, var data) async {
    var responseJson;
    await _init();
    try {
      final response = await http.post(
        _host + _endPoint,
        body: data,
        headers: {
          'Authorization': _authToken,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
      );
      if (response.statusCode == 200) {
        responseJson = json.decode(response.body);
      } else if (response.statusCode == 401) {
        responseJson = {
          'status': 'error',
          'type': 'unauthenticated',
          'message': 'Error Occurred',
        };
      } else {
        responseJson = {
          'status': 'error',
          'message': 'Error Occurred',
        };
      }
      return responseJson;
    } catch (exception) {
      if (exception.toString().contains('SocketException')) {
        responseJson = {
          'status': 'error',
          'message': 'Network Error',
        };
      } else {
        responseJson = {
          'status': 'error',
          'message': 'Some Error Occurred',
        };
      }
      return responseJson;
    }
  }

  static insertMultipart(
    String _endpoint,
    Map<String, String> data,
    File inputFile,
    Function returnFunction,
  ) async {
    await _init();
    var uri = Uri.parse(_host + _endpoint);
    var request = http.MultipartRequest("POST", uri);

    request.headers['Authorization'] = 'Bearer ' + _authToken;
    request.headers['Accept'] = 'application/json';
    request.headers['Content-Type'] = 'application/json';
    request.fields.addAll(data);
    var multipartFile =
        await http.MultipartFile.fromPath("image", inputFile.path);
    request.files.add(multipartFile);
    request.send().then((response) {
      if (response.statusCode == 200) {
        returnFunction(true);
      } else {
        returnFunction(false);
      }
      //_printRespose(response);
    });
    //_mockResponse(returnFunction);
  }

  static Future<void> _init() async {
    _authToken = await AuthUtils.getToken();
  }

  static void _mockResponse(Function returnFunction) {
    Future.delayed(Duration(seconds: 2)).then((onValue) {
      returnFunction(true);
    });
  }

  static void _printFileSize(File inputFile, Function returnFunction) {
    inputFile.length().then((size) {
      debugPrint((size / 1024).toString());
    });
    returnFunction(false);
  }

  static void _printRespose(dynamic response) {
    http.Response.fromStream(response).then((jsonResponse) {
      debugPrint(jsonResponse.body.toString());
    });
  }
}
