import 'dart:developer';

import 'package:app/modules/spl/model/spl.dart';
import 'package:app/modules/spl/repository/spl_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'spl_load_state.dart';

class SplLoadCubit extends Cubit<SplLoadState> {
  final _splRepository = SplRepository();

  SplLoadCubit() : super(SplLoadState());

  load({DateTime? date}) async {
    try {
      emit(state.copyWith(isLoading: true, date: date));
      var response = await _splRepository.load(date ?? DateTime.now());
      emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

// additional feature
}
