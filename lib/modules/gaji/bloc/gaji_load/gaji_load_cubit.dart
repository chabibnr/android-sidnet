import 'dart:developer';

import 'package:app/modules/gaji/model/gaji.dart';
import 'package:app/modules/gaji/repository/gaji_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gaji_load_state.dart';

class GajiLoadCubit extends Cubit<GajiLoadState> {
  final _gajiRepository = GajiRepository();

  GajiLoadCubit() : super(GajiLoadState());

  load({DateTime? date}) async {
    try {
      emit(state.copyWith(isLoading: true, date: date ?? DateTime.now()));
      var response = await _gajiRepository.load(date ?? DateTime.now());
      emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

// additional feature
}
