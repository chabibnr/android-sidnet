import 'dart:developer';

import 'package:app/app.dart';
import 'package:app/helper/form_state.dart';
import 'package:app/modules/spl/model/spl.dart';
import 'package:app/modules/spl/repository/spl_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

part 'spl_add_state.dart';

class SplAddCubit extends Cubit<SplAddState> {
  final _splRepository = SplRepository();

  SplAddCubit() : super(SplAddState());

  load(Spl model) async {
    try {
      emit(state.copyWith(isLoading: false, data: model));
      log("After dsfsdf ");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

  execute() async {
    try {
      if (state.formKey.currentState!.saveAndValidate()) {
        DateTime tgl = state.formKey.currentState?.fields['spl_tgl_spl']?.value;
        DateTime time = state.formKey.currentState?.fields['spl_lama']?.value;
        var model = Spl(
          pegawaiId: App.I.session.getAuthData()!.pegawaiId,
          splTglSpl: DateFormat("yyyy-MM-dd").format(tgl),
          splLama: DateFormat("HH:mm").format(time),
          splKeterangan: state.formKey.currentState?.fields['spl_keterangan']?.value,
        );
        emit(state.copyWith(status: SubmitStatus.progress, data: model));
        var response = await _splRepository.add(model);

        emit(state.copyWith(status: response.respError != null && response.respError! ? SubmitStatus.failure : SubmitStatus.success, data: response));
      }

      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

// additional feature
}
