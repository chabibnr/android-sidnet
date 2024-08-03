import 'dart:developer';

import 'package:app/app.dart';
import 'package:app/modules/absensi/model/absensi_widget.dart';

import '../model/absensi.dart';
import '../service/absensi_service.dart';

class AbsensiRepository {
  final _service = App.I.chopper.getService<AbsensiService>();

  Future<AbsensiList> load({required DateTime date}) async {
    try {
      var response = await _service.load(pegawaiId: App.I.session.getAuthData()!.pegawaiId, bulan: date.month.toString(), tahun: date.year.toString());
      if (response.statusCode == 401) {
        throw Error();
      }
      return AbsensiList.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<Absensi> view(Absensi model) async {
    try {
      var response = await _service.view();
      if (response.statusCode == 401) {
        throw Error();
      }
      return Absensi.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<AbsensiWidget> widget(String pegawaiId) async {
    try {
      var response = await _service.widget(pegawaiId: pegawaiId);
      if (response.statusCode == 401) {
        throw Error();
      }
      return AbsensiWidget.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<Absensi> add(Absensi model) async {
    try {
      var response = await _service.add(
        pegawaiId: model.pegawaiId!,
        latitude: model.lat!,
        longitude: model.long!,
        photoPath: model.foto,
      );
      if (response.statusCode == 401) {
        throw Error();
      }
      return Absensi.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<Absensi> update(Absensi model) async {
    try {
      var response = await _service.update();
      if (response.statusCode == 401) {
        throw Error();
      }
      return Absensi.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<Absensi> delete(Absensi model) async {
    try {
      var response = await _service.delete();
      if (response.statusCode == 401) {
        throw Error();
      }
      return Absensi.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

// additional feature
}
