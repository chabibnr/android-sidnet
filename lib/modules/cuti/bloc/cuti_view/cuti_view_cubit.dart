import 'dart:developer';

import 'package:app/modules/cuti/model/cuti.dart';
import 'package:app/modules/cuti/repository/cuti_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'cuti_view_state.dart';

class CutiViewCubit extends Cubit<CutiViewState> {
  final _cutiRepository = CutiRepository();

  CutiViewCubit() : super(CutiViewState());

  load(Cuti model) async {
    try {
      emit(state.copyWith(isLoading: true));
      var response = await _cutiRepository.view(model);
      emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

  execute() async {
    try {
      var response = await _cutiRepository.view(state.data!);
      emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

// additional feature
}
