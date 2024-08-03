import 'dart:developer';

import 'package:app/app.dart';
import 'package:app/modules/pinjaman/model/angsuran.dart';

import '../model/pinjaman.dart';
import '../service/pinjaman_service.dart';

class PinjamanRepository {
  final _service = App.I.chopper.getService<PinjamanService>();

  Future<PinjamanList> load(DateTime date) async {
    try {
      var response = await _service.load(
        pegawaiId: App.I.session.getAuthData()!.pegawaiId,
        tahun: date.year.toString(),
      );
      if (response.statusCode == 401) {
        throw Error();
      }
      return PinjamanList.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<AngsuranList> view(Pinjaman model) async {
    try {
      var response = await _service.view(id: model.pinjamanId!);
      if (response.statusCode == 401) {
        throw Error();
      }
      return AngsuranList.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

// additional feature
}
