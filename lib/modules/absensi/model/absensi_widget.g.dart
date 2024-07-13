// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absensi_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbsensiWidget _$AbsensiWidgetFromJson(Map<String, dynamic> json) =>
    AbsensiWidget(
      respError: json['resp_error'] as bool?,
      respMsg: json['resp_msg'] as String?,
      masuk: (json['masuk'] as num?)?.toInt(),
      tidakmasuk: (json['tidakmasuk'] as num?)?.toInt(),
      cuti: (json['cuti'] as num?)?.toInt(),
      alpha: (json['alpha'] as num?)?.toInt(),
      absensiIn: json['absensi_in'] as String?,
      absensiOut: json['absensi_out'] as String?,
    );

Map<String, dynamic> _$AbsensiWidgetToJson(AbsensiWidget instance) =>
    <String, dynamic>{
      'resp_error': instance.respError,
      'resp_msg': instance.respMsg,
      'masuk': instance.masuk,
      'tidakmasuk': instance.tidakmasuk,
      'cuti': instance.cuti,
      'alpha': instance.alpha,
      'absensi_in': instance.absensiIn,
      'absensi_out': instance.absensiOut,
    };
