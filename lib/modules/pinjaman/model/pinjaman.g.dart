// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pinjaman.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinjamanList _$PinjamanListFromJson(Map<String, dynamic> json) => PinjamanList(
      respError: json['resp_error'] as bool?,
      respMsg: json['resp_msg'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Pinjaman.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PinjamanListToJson(PinjamanList instance) =>
    <String, dynamic>{
      'resp_error': instance.respError,
      'resp_msg': instance.respMsg,
      'items': instance.items,
    };

Pinjaman _$PinjamanFromJson(Map<String, dynamic> json) => Pinjaman(
      pinjamanId: json['pinjaman_id'] as String?,
      pinjamanCode: json['pinjaman_code'] as String?,
      pinjamanDate: json['pinjaman_date'] as String?,
      pinjamanTipe: json['pinjaman_tipe'] as String?,
      pinjamanJk: json['pinjaman_jk'] as String?,
      pinjamanTotal: json['pinjaman_total'] as String?,
      pinjamanStatus: json['pinjaman_status'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$PinjamanToJson(Pinjaman instance) => <String, dynamic>{
      'pinjaman_id': instance.pinjamanId,
      'pinjaman_code': instance.pinjamanCode,
      'pinjaman_date': instance.pinjamanDate,
      'pinjaman_tipe': instance.pinjamanTipe,
      'pinjaman_jk': instance.pinjamanJk,
      'pinjaman_total': instance.pinjamanTotal,
      'pinjaman_status': instance.pinjamanStatus,
      'status': instance.status,
    };
