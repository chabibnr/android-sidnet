import 'dart:developer';

import 'package:app/app.dart';
import 'package:app/helper/form_state.dart';
import 'package:app/modules/cuti/model/cuti.dart';
import 'package:app/modules/cuti/repository/cuti_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:intl/intl.dart';

part 'cuti_add_state.dart';

class CutiAddCubit extends Cubit<CutiAddState> {
  final _cutiRepository = CutiRepository();

  CutiAddCubit() : super(CutiAddState());

  load(Cuti model) async {
    try {
      var response = await _cutiRepository.jenisCuti();
      print(response);
      emit(state.copyWith(isLoading: false, data: model, jenisCuti: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

  updateModel(Cuti model) {
    emit(state.copyWith(data: model));
  }

  execute() async {
    try {
      if (state.formKey.currentState!.saveAndValidate()) {
        PlatformFile attachment = state.formKey.currentState?.fields['cuti_bukti']?.value[0];
        DateTime dari = state.formKey.currentState?.fields['cuti_dari']?.value;
        DateTime sampai = state.formKey.currentState?.fields['cuti_sampai']?.value;
        String jenis_absensi_id = state.formKey.currentState?.fields['jenis_absensi_id']?.value;
        String keperluan = state.formKey.currentState?.fields['cuti_keperluan']?.value;

        emit(state.copyWith(status: SubmitStatus.progress));
        var model = Cuti(
          pegawaiId: App.I.session.getAuthData()!.pegawaiId,
          cutiDari: DateFormat("yyyy-MM-dd").format(dari),
          cutiSampai: DateFormat("yyyy-MM-dd").format(sampai),
          jenisAbsensiId: jenis_absensi_id,
          cutiKeperluan: keperluan,
          cutiFile: attachment.path,
        );
        emit(state.copyWith(status: SubmitStatus.progress));
        var response = await _cutiRepository.add(model);
        if (response.respError == false) {
          emit(state.copyWith(status: SubmitStatus.success));
        } else {
          emit(state.copyWith(status: SubmitStatus.failure, message: response.respMsg));
        }
      }
      //var response = await _cutiRepository.add(state.data!);
      //emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

// additional feature
}
