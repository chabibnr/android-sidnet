// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gaji_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$GajiService extends GajiService {
  _$GajiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = GajiService;

  @override
  Future<Response<dynamic>> load({
    required String pegawaiId,
    required String tahun,
  }) {
    final Uri $url = Uri.parse('mobile/listgaji');
    final $body = <String, dynamic>{
      'pegawai_id': pegawaiId,
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
  Future<Response<dynamic>> view({required String id}) {
    final Uri $url = Uri.parse('mobile/detailgaji');
    final $body = <String, dynamic>{'gaji_id': id};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
