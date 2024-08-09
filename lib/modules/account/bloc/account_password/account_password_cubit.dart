import 'dart:developer';

import 'package:app/helper/form_state.dart';
import 'package:app/modules/account/model/account.dart';
import 'package:app/modules/account/repository/account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'account_password_state.dart';

class AccountPasswordCubit extends Cubit<AccountPasswordState> {
  final _accountRepository = AccountRepository();

  AccountPasswordCubit() : super(AccountPasswordState(isLoading: false));

  load() async {
    try {
      emit(state.copyWith(isLoading: false));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

  execute() async {
    try {
      if (state.formKey.currentState!.saveAndValidate()) {
        String pass1 = state.formKey.currentState?.fields['password']?.value;
        String pass2 = state.formKey.currentState?.fields['confirm']?.value;

        emit(state.copyWith(status: SubmitStatus.progress));
        var response = await _accountRepository.changePassword(pass1, pass2);
        if (response.respError == true) {
          emit(state.copyWith(status: SubmitStatus.failure, data: response));
        } else {
          emit(state.copyWith(status: SubmitStatus.success, data: response));
        }
        log("After Emit data");
      }
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

// additional feature
}
