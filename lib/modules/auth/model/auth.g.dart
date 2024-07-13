// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth(
      respError: json['resp_error'] as bool,
      respMsg: json['resp_msg'] as String,
      cabangId: json['cabang_id'] as String,
      cabangNama: json['cabang_nama'] as String,
      username: json['username'] as String,
      nama: json['nama'] as String,
      pegawaiId: json['pegawai_id'] as String,
      jabatan: json['jabatan'] as String,
      telp: json['telp'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
      level: json['level'] as String,
      device: json['device'] as String,
    );

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'resp_error': instance.respError,
      'resp_msg': instance.respMsg,
      'cabang_id': instance.cabangId,
      'cabang_nama': instance.cabangNama,
      'username': instance.username,
      'nama': instance.nama,
      'pegawai_id': instance.pegawaiId,
      'jabatan': instance.jabatan,
      'telp': instance.telp,
      'email': instance.email,
      'avatar': instance.avatar,
      'level': instance.level,
      'device': instance.device,
    };
