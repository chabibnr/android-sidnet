import 'dart:developer';

import 'package:app/app.dart';

import '../model/cuti.dart';
import '../service/cuti_service.dart';

class CutiRepository {
  final _service = App.I.chopper.getService<CutiService>();

  Future<CutiList> load() async {
    try {
      var response = await _service.load(
        pegawaiId: App.I.session.getAuthData()!.pegawaiId,
        tahun: '2024',
        bulan: '7',
      );
      if (response.statusCode == 401) {
        throw Error();
      }
      return CutiList.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<Cuti> view(Cuti model) async {
    try {
      var response = await _service.view();
      if (response.statusCode == 401) {
        throw Error();
      }
      return Cuti.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<Cuti> add(Cuti model) async {
    try {
      print(model.toJson());
      var response = await _service.add(
        pegawaiId: model.pegawaiId!,
        filePath: model.cutiFile!,
        jenisCutiId: model.jenisAbsensiId!,
        keperluan: model.cutiKeperluan!,
        since: model.cutiDari!,
        until: model.cutiSampai!,
      );
      if (response.statusCode == 401) {
        throw Error();
      }
      return Cuti.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<Cuti> update(Cuti model) async {
    try {
      var response = await _service.update();
      if (response.statusCode == 401) {
        throw Error();
      }
      return Cuti.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<Cuti> delete(Cuti model) async {
    try {
      var response = await _service.delete();
      if (response.statusCode == 401) {
        throw Error();
      }
      return Cuti.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<dynamic> jenisCuti() async {
    try {
      var response = await _service.jenisCuti();
      if (response.statusCode == 401) {
        throw Error();
      }
      return response.body['items'];
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

// additional feature
}
