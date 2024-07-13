// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AccountService extends AccountService {
  _$AccountService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AccountService;

  @override
  Future<Response<dynamic>> profile() {
    final Uri $url = Uri.parse('mobile/profil');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
