import 'dart:developer';

import 'package:app/modules/cuti/model/cuti.dart';
import 'package:app/modules/cuti/repository/cuti_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cuti_load_state.dart';

class CutiLoadCubit extends Cubit<CutiLoadState> {
  final _cutiRepository = CutiRepository();

  CutiLoadCubit() : super(CutiLoadState());

  load({DateTime? date}) async {
    try {
      emit(state.copyWith(isLoading: true, date: date));
      var response = await _cutiRepository.load(date ?? DateTime.now());
      emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

// additional feature
}
