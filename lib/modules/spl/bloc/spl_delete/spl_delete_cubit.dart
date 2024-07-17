import 'dart:developer';

import 'package:app/modules/spl/model/spl.dart';
import 'package:app/modules/spl/repository/spl_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';

part 'spl_delete_state.dart';

class SplDeleteCubit extends Cubit<SplDeleteState> {
    final _splRepository = SplRepository();

    SplDeleteCubit() : super(SplDeleteState());

    load(Spl model) async {
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
            var response = await _splRepository.delete(state.data!);
            emit(state.copyWith(isLoading: false, data: response));
            log("After Emit data");
        } catch (e) {
            log(e.toString());
            log("Error emit data");
        }
   }

    // additional feature
}
