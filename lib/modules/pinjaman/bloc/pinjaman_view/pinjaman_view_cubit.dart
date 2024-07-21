import 'dart:developer';

import 'package:app/modules/pinjaman/model/angsuran.dart';
import 'package:app/modules/pinjaman/model/pinjaman.dart';
import 'package:app/modules/pinjaman/repository/pinjaman_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'pinjaman_view_state.dart';

class PinjamanViewCubit extends Cubit<PinjamanViewState> {
  final _pinjamanRepository = PinjamanRepository();

  PinjamanViewCubit() : super(PinjamanViewState());

  load(Pinjaman model) async {
    try {
      var response = await _pinjamanRepository.view(model);
      emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }
// additional feature
}
