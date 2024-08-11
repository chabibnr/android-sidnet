import 'dart:developer';

import 'package:app/helper/form_state.dart';
import 'package:app/modules/account/model/account.dart';
import 'package:app/modules/account/repository/account_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_cropper/image_cropper.dart';

part 'account_photo_state.dart';

class AccountPhotoCubit extends Cubit<AccountPhotoState> {
  final _accountRepository = AccountRepository();

  AccountPhotoCubit() : super(AccountPhotoState(isLoading: false));

  load() async {
    try {
      emit(state.copyWith(isLoading: false));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

  execute(CroppedFile file) async {
    try {
      log("file Uploaded: ${file.path}");
      emit(state.copyWith(status: SubmitStatus.progress));
      var response = await _accountRepository.changeAvatar(file.path);
      if (kDebugMode) {
        print(response.toJson());
      }
      if (response.respError == true) {
        emit(state.copyWith(status: SubmitStatus.failure, data: response));
      } else {
        emit(state.copyWith(status: SubmitStatus.success, data: response));
      }
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: SubmitStatus.failure, data: Account(respError: true, respMsg: "Error upload file")));
      log("Error emit data");
    }
  }

// additional feature
}
