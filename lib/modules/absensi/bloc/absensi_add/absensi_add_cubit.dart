import 'dart:developer';

import 'package:app/modules/absensi/model/absensi.dart';
import 'package:app/modules/absensi/repository/absensi_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'absensi_add_state.dart';

class AbsensiAddCubit extends Cubit<AbsensiAddState> {
  final _absensiRepository = AbsensiRepository();

  AbsensiAddCubit() : super(AbsensiAddState());

  load(Absensi model) async {
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
      log(state.formKey.currentState?.fields as String);
      //var response = await _absensiRepository.add(state.data!);
      //emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

// additional feature
}
