// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cuti_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CutiService extends CutiService {
  _$CutiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CutiService;

  @override
  Future<Response<dynamic>> load({
    required String pegawaiId,
    required String bulan,
    required String tahun,
  }) {
    final Uri $url = Uri.parse('mobile/listcuti');
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
    final Uri $url = Uri.parse('mobile/detailcuti');
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
    required String jenisCutiId,
    required String since,
    required String until,
    required String keperluan,
    required String filePath,
  }) {
    final Uri $url = Uri.parse('mobile/simpancuti');
    final Map<String, String> $headers = {
      'Content-Type': 'multipart/formdata',
    };
    final $body = <String, dynamic>{
      'pegawai_id': pegawaiId,
      'janis_absensi_id': jenisCutiId,
      'tgl_dari': since,
      'tgl_sampai': until,
      'keperluan': keperluan,
    };
    print($body);
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<String>(
        'file',
        filePath,
      )
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parts: $parts,
      multipart: true,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> update() {
    final Uri $url = Uri.parse('mobile/updatecuti');
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

  @override
  Future<Response<dynamic>> jenisCuti() {
    final Uri $url = Uri.parse('mobile/listjenisabsensi');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
