import 'dart:developer';

import 'package:app/modules/gaji/model/gaji.dart';
import 'package:app/modules/gaji/repository/gaji_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'gaji_view_state.dart';

class GajiViewCubit extends Cubit<GajiViewState> {
  final _gajiRepository = GajiRepository();

  GajiViewCubit() : super(GajiViewState());

  load(Gaji model) async {
    try {
      emit(state.copyWith(isLoading: true, data: null));
      var response = await _gajiRepository.view(model);
      emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

// additional feature
}
