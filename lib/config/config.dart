import 'dart:developer';
import 'dart:io';

import 'package:app/interceptor/auth_request_interceptor.dart';
import 'package:app/modules/absensi/service/absensi_service.dart';
import 'package:app/modules/account/service/account_service.dart';
import 'package:app/modules/auth/service/auth_service.dart';
import 'package:app/modules/cuti/service/cuti_service.dart';
import 'package:app/modules/gaji/service/gaji_service.dart';
import 'package:app/modules/pinjaman/service/pinjaman_service.dart';
import 'package:app/modules/spl/service/spl_service.dart';
import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' show IOClient;
import 'package:intl/date_symbol_data_local.dart';
import 'package:localstorage/localstorage.dart';
import 'package:logging/logging.dart' as logging;

class Config {
  String sessionBoxName = 'session_box';

  ChopperClient chopperClient() {
    return ChopperClient(
      baseUrl: Uri.parse('https://hrd.sidnet.co.id/api'),
      //baseUrl: Uri.parse('https://hrd.prospak.id/api'),
      client: IOClient(HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true)),
      interceptors: [
        HttpLoggingInterceptor(),
        AuthRequestInterceptor(),
        const HeadersInterceptor({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }),
      ],
      services: [
        AuthService.create(),
        AccountService.create(),
        AbsensiService.create(),
        SplService.create(),
        GajiService.create(),
        PinjamanService.create(),
        CutiService.create(),
      ],
      converter: const JsonConverter(),
    );
  }

  init() async {
    initializeDateFormatting();
    await initLocalStorage();
    setupLogging();
  }

  void setupLogging() {
    logging.Logger.root.level = logging.Level.ALL;
    logging.Logger.root.onRecord.listen((rec) {
      log(rec.message);
    });
  }
}
