import 'dart:convert';
import 'dart:developer';

import 'package:app/modules/auth/model/auth.dart';
import 'package:localstorage/localstorage.dart';

class Session {
  Session() {
    log("Session init loaded -------------- ");
  }

  setIntroComplete(String isComplete) async {
    localStorage.setItem('intro', isComplete);
  }

  bool getIntroComplete() {
    return localStorage.getItem('intro') == 'yes';
  }

  setToken(String token) async {
    localStorage.setItem('token', token);
  }

  String getToken() {
    late String? mToken = localStorage.getItem('token');
    if (mToken == null) {
      return '';
    }
    return mToken;
  }

  setAuthData(Auth value) async {
    localStorage.setItem('auth', jsonEncode(value));
  }

  Auth? getAuthData() {
    var value = localStorage.getItem('auth') as String;
    try {
      return Auth.fromJson(jsonDecode(value));
    } catch (error) {
      return null;
    }
  }

  destroy() {
    localStorage.clear();
  }
}
