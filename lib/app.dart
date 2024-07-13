import 'dart:async';

import 'package:app/config/config.dart';
import 'package:app/library/session.dart';
import 'package:chopper/chopper.dart';

class App {
  static final App I = App._();
  late Config config;
  ChopperClient? _chopper;
  Session? _session;
  Timer? timer;

  ChopperClient get chopper {
    _chopper ??= config.chopperClient();
    return _chopper!;
  }

  Session get session {
    _session ??= Session();
    return _session!;
  }

  @Deprecated("Ini akan dihapus, gunakan App.I untuk selanjutnya")
  factory App() {
    return I;
  }

  App._();
}
