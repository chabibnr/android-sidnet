import 'dart:developer';

import 'package:app/modules/cuti/model/cuti.dart';
import 'package:app/modules/cuti/repository/cuti_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';

part 'cuti_update_state.dart';

class CutiUpdateCubit extends Cubit<CutiUpdateState> {
    final _cutiRepository = CutiRepository();

    CutiUpdateCubit() : super(CutiUpdateState());

    load(Cuti model) async {
        try {
            emit(state.copyWith(isLoading: false, data: model));
            log("After Emit data");
        } catch (e) {
            log(e.toString());
            log("Error emit data");
        }
   }

    execute() async {
        try {
            var response = await _cutiRepository.update(state.data!);
            emit(state.copyWith(isLoading: false, data: response));
            log("After Emit data");
        } catch (e) {
            log(e.toString());
            log("Error emit data");
        }
   }

    // additional feature
}
