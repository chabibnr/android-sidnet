import 'dart:developer';

import 'package:app/modules/absensi/model/absensi.dart';
import 'package:app/modules/absensi/repository/absensi_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'absensi_delete_state.dart';

class AbsensiDeleteCubit extends Cubit<AbsensiDeleteState> {
    final _absensiRepository = AbsensiRepository();

    AbsensiDeleteCubit() : super(const AbsensiDeleteState());

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
            var response = await _absensiRepository.delete(state.data!);
            emit(state.copyWith(isLoading: false, data: response));
            log("After Emit data");
        } catch (e) {
            log(e.toString());
            log("Error emit data");
        }
   }

    // additional feature
}
