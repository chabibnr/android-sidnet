import 'dart:developer';

import 'package:app/app.dart';

import '../model/cuti.dart';
import '../service/cuti_service.dart';

class CutiRepository {
  final _service = App.I.chopper.getService<CutiService>();

  Future<CutiList> load(DateTime date) async {
    try {
      var response = await _service.load(
        pegawaiId: App.I.session.getAuthData()!.pegawaiId,
        tahun: date.year.toString(),
        bulan: date.month.toString(),
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
      var response = await _service.view(id: model.cutiId!);
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
      // var json = jsonDecode('{"resp_error":true,"resp_msg":"Pengajuan Cuti Berhasil"}');
      // await Future.delayed(Duration(seconds: 10));
      // return Cuti.fromJson(json);
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
      throw Exception('Failed $e');
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
