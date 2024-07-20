// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spl_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SplService extends SplService {
  _$SplService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SplService;

  @override
  Future<Response<dynamic>> load({
    required String pegawaiId,
    required String bulan,
    required String tahun,
  }) {
    final Uri $url = Uri.parse('mobile/listspl');
    final $body = <String, dynamic>{
      'pegawai_id': pegawaiId,
      'bulan': bulan,
      'tahun': tahun,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> view() {
    final Uri $url = Uri.parse('mobile/view');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> add({
    required String pegawaiId,
    required String date,
    required String duration,
    required String description,
  }) {
    final Uri $url = Uri.parse('mobile/simpanspl');
    final $body = <String, dynamic>{
      'pegawai_id': pegawaiId,
      'tgl_spl': date,
      'lama': duration,
      'keterangan': description,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> update() {
    final Uri $url = Uri.parse('mobile/update');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> delete() {
    final Uri $url = Uri.parse('mobile/delete');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
