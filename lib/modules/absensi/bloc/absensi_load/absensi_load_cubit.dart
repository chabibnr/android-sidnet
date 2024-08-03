import 'dart:developer';

import 'package:app/modules/absensi/model/absensi.dart';
import 'package:app/modules/absensi/repository/absensi_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'absensi_load_state.dart';

class AbsensiLoadCubit extends Cubit<AbsensiLoadState> {
  final _absensiRepository = AbsensiRepository();

  AbsensiLoadCubit() : super(AbsensiLoadState());

  load({DateTime? date}) async {
    try {
      emit(state.copyWith(isLoading: true, date: date));
      var response = await _absensiRepository.load(date: date ?? DateTime.now());
      emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

// additional feature
}
