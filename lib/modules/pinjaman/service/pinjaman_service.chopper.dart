// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pinjaman_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$PinjamanService extends PinjamanService {
  _$PinjamanService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = PinjamanService;

  @override
  Future<Response<dynamic>> load({
    required String pegawaiId,
    required String tahun,
  }) {
    final Uri $url = Uri.parse('mobile/listpinjaman');
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
    final Uri $url = Uri.parse('mobile/detailpinjaman');
    final $body = <String, dynamic>{'pinjaman_id': id};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
