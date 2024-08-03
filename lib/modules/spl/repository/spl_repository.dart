import 'dart:developer';

import 'package:app/app.dart';

import '../model/spl.dart';
import '../service/spl_service.dart';

class SplRepository {
  final _service = App.I.chopper.getService<SplService>();

  Future<SplList> load(DateTime date) async {
    try {
      var response = await _service.load(
        pegawaiId: App.I.session.getAuthData()!.pegawaiId,
        tahun: date.year.toString(),
        bulan: date.month.toString(),
      );
      if (response.statusCode == 401) {
        throw Error();
      }
      return SplList.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<Spl> view(Spl model) async {
    try {
      var response = await _service.view();
      if (response.statusCode == 401) {
        throw Error();
      }
      return Spl.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<Spl> add(Spl model) async {
    try {
      var response = await _service.add(
        pegawaiId: model.pegawaiId!,
        date: model.splTglSpl!,
        description: model.splKeterangan!,
        duration: model.splLama!,
      );
      if (response.statusCode == 401) {
        throw Error();
      }
      return Spl.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<Spl> update(Spl model) async {
    try {
      var response = await _service.update();
      if (response.statusCode == 401) {
        throw Error();
      }
      return Spl.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

  Future<Spl> delete(Spl model) async {
    try {
      var response = await _service.delete();
      if (response.statusCode == 401) {
        throw Error();
      }
      return Spl.fromJson(response.body);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to login');
    }
  }

// additional feature
}
