// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absensi_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AbsensiService extends AbsensiService {
  _$AbsensiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AbsensiService;

  @override
  Future<Response<dynamic>> load({
    required String pegawaiId,
    required String bulan,
    required String tahun,
  }) {
    final Uri $url = Uri.parse('mobile/listabsensi');
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
  Future<Response<dynamic>> widget({required String pegawaiId}) {
    final Uri $url = Uri.parse('mobile/dashboard');
    final $body = <String, dynamic>{'pegawai_id': pegawaiId};
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
    required String latitude,
    required String longitude,
    required String? photoPath,
  }) {
    final Uri $url = Uri.parse('mobile/prosesabsen');
    final Map<String, String> $headers = {
      'Content-Type': 'multipart/formdata',
    };
    final List<PartValue> $parts = <PartValue>[
      PartValue<String>(
        'pegawai_id',
        pegawaiId,
      ),
      PartValue<String>(
        'lat',
        latitude,
      ),
      PartValue<String>(
        'long',
        longitude,
      ),
      PartValueFile<String?>(
        'foto',
        photoPath,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      headers: $headers,
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
