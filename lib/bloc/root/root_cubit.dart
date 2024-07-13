import 'dart:async';
import 'dart:developer';
import 'dart:math' show Random;

import 'package:app/app.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  bool isAuthorization = false;
  late PackageInfo _appInfo;
  int logoutTrying = 0;

  RootCubit() : super(RootInitialize());

  void load() async {
    _appInfo = await PackageInfo.fromPlatform();
    try {
      var token = App.I.session.getToken();
      if ((token.isEmpty)) {
        throw ('un logged user');
      }
      Timer(const Duration(seconds: 3), () {
        openMainScreen();
      });
    } catch (error) {
      openAuthScreen();
    }
  }

  void openMainScreen() {
    emit(RootMain());
  }

  void openSplashScreen() {
    emit(RootSplashScreen());
  }

  void openAuthScreen() {
    emit(RootAuth());
  }

  void confirmAuthDestroy() {
    log('confirmAuthDestroy');
    final random = Random();
    emit(RootAuthDestroy(random.nextInt(100)));
  }

  void authDestroy() {
    App.I.session.destroy();
    emit(RootInitialize());
  }

  PackageInfo get appInfo => _appInfo;

  Future<bool> get isIntroCompleted async {
    return App().session.getIntroComplete();
  }

  void markIntroAsComplete() async {
    await App().session.setIntroComplete('yes');
    load();
  }
}
