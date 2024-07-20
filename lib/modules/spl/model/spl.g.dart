// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplList _$SplListFromJson(Map<String, dynamic> json) => SplList(
      respError: json['resp_error'] as bool?,
      respMsg: json['resp_msg'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Spl.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SplListToJson(SplList instance) => <String, dynamic>{
      'resp_error': instance.respError,
      'resp_msg': instance.respMsg,
      'items': instance.items,
    };

Spl _$SplFromJson(Map<String, dynamic> json) => Spl(
      pegawaiId: json['pegawai_id'] as String?,
      splId: json['spl_id'] as String?,
      splNomor: json['spl_nomor'] as String?,
      splTanggal: json['spl_tanggal'] as String?,
      splTglSpl: json['spl_tgl_spl'] as String?,
      splLama: json['spl_lama'] as String?,
      splKeterangan: json['spl_keterangan'] as String?,
      splStatus: json['spl_status'] as String?,
      splAlasanPenolakan: json['spl_alasan_penolakan'] as String?,
    )
      ..respError = json['resp_error'] as bool?
      ..respMsg = json['resp_msg'] as String?;

Map<String, dynamic> _$SplToJson(Spl instance) => <String, dynamic>{
      'resp_error': instance.respError,
      'resp_msg': instance.respMsg,
      'pegawai_id': instance.pegawaiId,
      'spl_id': instance.splId,
      'spl_nomor': instance.splNomor,
      'spl_tanggal': instance.splTanggal,
      'spl_tgl_spl': instance.splTglSpl,
      'spl_lama': instance.splLama,
      'spl_keterangan': instance.splKeterangan,
      'spl_status': instance.splStatus,
      'spl_alasan_penolakan': instance.splAlasanPenolakan,
    };
