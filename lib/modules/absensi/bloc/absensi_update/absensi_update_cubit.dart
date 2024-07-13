import 'dart:developer';

import 'package:app/modules/absensi/model/absensi.dart';
import 'package:app/modules/absensi/repository/absensi_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'absensi_update_state.dart';

class AbsensiUpdateCubit extends Cubit<AbsensiUpdateState> {
    final _absensiRepository = AbsensiRepository();

    AbsensiUpdateCubit() : super(const AbsensiUpdateState());

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
            var response = await _absensiRepository.update(state.data!);
            emit(state.copyWith(isLoading: false, data: response));
            log("After Emit data");
        } catch (e) {
            log(e.toString());
            log("Error emit data");
        }
   }

    // additional feature
}
