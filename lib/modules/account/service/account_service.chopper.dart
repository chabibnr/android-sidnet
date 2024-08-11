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

  @override
  Future<Response<dynamic>> avatar({required String photo}) {
    final Uri $url = Uri.parse('mobile/updateavatar');
    final Map<String, String> $headers = {
      'Content-Type': 'multipart/formdata',
    };
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<String>(
        'foto',
        photo,
      )
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
  Future<Response<dynamic>> password({
    required String password,
    required String confirmPassword,
  }) {
    final Uri $url = Uri.parse('mobile/gantipassword');
    final $body = <String, dynamic>{
      'password': password,
      'konfirm': confirmPassword,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
