import 'dart:developer';

import 'package:app/app.dart';

import '../model/spl.dart';
import '../service/spl_service.dart';

class SplRepository {
  final _service = App.I.chopper.getService<SplService>();

  Future<SplList> load() async {
    try {
      var response = await _service.load(pegawaiId: '1', tahun: '2024', bulan: '7');
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
      var response = await _service.add();
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
