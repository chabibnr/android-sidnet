// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'angsuran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AngsuranList _$AngsuranListFromJson(Map<String, dynamic> json) => AngsuranList(
      respError: json['resp_error'] as bool?,
      respMsg: json['resp_msg'] as String?,
      items: (json['item'] as List<dynamic>?)
          ?.map((e) => Angsuran.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AngsuranListToJson(AngsuranList instance) =>
    <String, dynamic>{
      'resp_error': instance.respError,
      'resp_msg': instance.respMsg,
      'item': instance.items,
    };

Angsuran _$AngsuranFromJson(Map<String, dynamic> json) => Angsuran(
      angsurKe: json['angsur_ke'] as String?,
      angsurBayar: json['angsur_bayar'] as String?,
      angsurTmp: json['angsur_tmp'] as String?,
      angsurAwal: json['angsur_awal'] as String?,
      angsurPokok: json['angsur_pokok'] as String?,
      angsurBunga: json['angsur_bunga'] as String?,
      angsurSka: json['angsur_ska'] as String?,
      angsurTotal: json['angsur_total'] as String?,
      angsurStatus: json['angsur_status'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AngsuranToJson(Angsuran instance) => <String, dynamic>{
      'angsur_ke': instance.angsurKe,
      'angsur_bayar': instance.angsurBayar,
      'angsur_tmp': instance.angsurTmp,
      'angsur_awal': instance.angsurAwal,
      'angsur_pokok': instance.angsurPokok,
      'angsur_bunga': instance.angsurBunga,
      'angsur_ska': instance.angsurSka,
      'angsur_total': instance.angsurTotal,
      'angsur_status': instance.angsurStatus,
      'status': instance.status,
    };
