import 'dart:convert';
import 'dart:developer';

import 'package:app/app.dart';
import 'package:app/modules/account/service/account_service.dart';
import 'package:flutter/foundation.dart';

import '../model/account.dart';

class AccountRepository {
  final _service = App.I.chopper.getService<AccountService>();

  Future<Account> profile() async {
    try {
      var response = await _service.profile();
      if (response.statusCode == 401) {
        throw Error();
      }
      return Account.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<Account> changePassword(String password, String confirmPassword) async {
    try {
      log('before request ');
      var response = await _service.password(password: password, confirmPassword: confirmPassword);
      log('after request ');
      if (kDebugMode) {
        print(response.error);
      }
      if (response.statusCode == 403) {
        return Account.fromJson(jsonDecode(response.error as String));
      }
      return Account.fromJson(response.body);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<Account> changeAvatar(String photo) async {
    try {
      var response = await _service.avatar(photo: photo);
      if (response.statusCode == 403) {
        return Account.fromJson(jsonDecode(response.error as String));
      }
      return Account.fromJson(response.body);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

// additional feature
}
