import 'dart:developer';

import 'package:app/app.dart';
import 'package:app/modules/account/service/account_service.dart';

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

// additional feature
}
