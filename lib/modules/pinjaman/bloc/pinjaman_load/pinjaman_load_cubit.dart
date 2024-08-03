import 'dart:developer';

import 'package:app/modules/pinjaman/model/pinjaman.dart';
import 'package:app/modules/pinjaman/repository/pinjaman_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pinjaman_load_state.dart';

class PinjamanLoadCubit extends Cubit<PinjamanLoadState> {
  final _pinjamanRepository = PinjamanRepository();

  PinjamanLoadCubit() : super(PinjamanLoadState());

  load({DateTime? date}) async {
    try {
      emit(state.copyWith(isLoading: true, date: date ?? DateTime.now()));
      var response = await _pinjamanRepository.load(date ?? DateTime.now());
      emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

// additional feature
}
