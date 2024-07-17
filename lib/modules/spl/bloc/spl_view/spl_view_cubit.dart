import 'dart:developer';

import 'package:app/modules/spl/model/spl.dart';
import 'package:app/modules/spl/repository/spl_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';

part 'spl_view_state.dart';

class SplViewCubit extends Cubit<SplViewState> {
    final _splRepository = SplRepository();

    SplViewCubit() : super(SplViewState());

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
            var response = await _splRepository.view(state.data!);
            emit(state.copyWith(isLoading: false, data: response));
            log("After Emit data");
        } catch (e) {
            log(e.toString());
            log("Error emit data");
        }
   }

    // additional feature
}
