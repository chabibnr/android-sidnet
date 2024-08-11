import 'dart:developer';

import 'package:app/app.dart';
import 'package:app/modules/account/model/account.dart';
import 'package:app/modules/account/repository/account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final _accountRepository = AccountRepository();

  AccountCubit() : super(const AccountState());

  load() async {
    try {
      var response = await _accountRepository.profile();
      emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

  changeAvatar(String? avatar) {
    if (avatar != null) {
      emit(state.copyWith(isLoading: true));
      var current = state.data;
      current?.avatar = avatar;
      var session = App.I.session.getAuthData();
      session?.avatar = avatar;
      App.I.session.setAuthData(session!);
      emit(state.copyWith(isLoading: false, data: current));
      log('Avatar changged ${current?.avatar}');
    } else {
      log('Avatar not changed ${avatar}');
    }
  }
}
