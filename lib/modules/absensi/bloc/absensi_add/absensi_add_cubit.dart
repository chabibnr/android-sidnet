import 'dart:developer';

import 'package:app/app.dart';
import 'package:app/helper/form_state.dart';
import 'package:app/modules/absensi/model/absensi.dart';
import 'package:app/modules/absensi/repository/absensi_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

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

  setPosition(Position? position) {
    emit(state.copyWith(position: position));
  }

  setPhoto(XFile? photo) {
    emit(state.copyWith(photo: photo));
  }

  execute() async {
    try {
      Absensi model = Absensi(
        pegawaiId: App.I.session.getAuthData()!.pegawaiId,
        lat: state.position?.latitude.toString(),
        long: state.position?.longitude.toString(),
        foto: state.photo!.path,
      );
      emit(state.copyWith(status: SubmitStatus.progress));
      var response = await _absensiRepository.add(model);

      emit(state.copyWith(isLoading: false, data: response));
      log("After Emit data");
    } catch (e) {
      log(e.toString());
      log("Error emit data");
    }
  }

// additional feature
}
