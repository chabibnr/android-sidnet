import 'dart:developer';

import 'package:app/modules/absensi/model/absensi.dart';
import 'package:app/modules/absensi/model/absensi_widget.dart';
import 'package:app/modules/absensi/repository/absensi_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'absensi_widget_state.dart';

class AbsensiWidgetCubit extends Cubit<AbsensiWidgetState> {
  final _absensiRepository = AbsensiRepository();

  AbsensiWidgetCubit() : super(AbsensiWidgetState());

  load() async {
    try {
      var response = await _absensiRepository.widget('1');
      emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

  execute() async {
    try {
      var response = await _absensiRepository.widget('');
      emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

// additional feature
}
