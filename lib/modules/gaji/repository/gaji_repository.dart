import 'dart:developer';

import 'package:app/app.dart';

import '../model/gaji.dart';
import '../service/gaji_service.dart';

class GajiRepository {
  final _service = App.I.chopper.getService<GajiService>();

  Future<GajiList> load() async {
    try {
      var response = await _service.load(
        //pegawaiId: App.I.session.getAuthData()!.pegawaiId,
        pegawaiId: '1',
        tahun: '2024',
      );
      if (response.statusCode == 401) {
        throw Error();
      }
      return GajiList.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<DetailGaji> view(Gaji model) async {
    try {
      var response = await _service.view(id: model.gajiId!);
      if (response.statusCode == 401) {
        throw Error();
      }
      return DetailGaji.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

// additional feature
}
