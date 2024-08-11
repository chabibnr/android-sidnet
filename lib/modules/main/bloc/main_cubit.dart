import 'dart:developer';

import 'package:app/app.dart';
import 'package:app/modules/auth/model/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(auth: App.I.session.getAuthData()!));

  load() async {
    emit(MainState(auth: App.I.session.getAuthData()!));
  }
}
