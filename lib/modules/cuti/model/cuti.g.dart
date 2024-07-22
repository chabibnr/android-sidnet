// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cuti.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CutiList _$CutiListFromJson(Map<String, dynamic> json) => CutiList(
      respError: json['resp_error'] as bool?,
      respMsg: json['resp_msg'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Cuti.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CutiListToJson(CutiList instance) => <String, dynamic>{
      'resp_error': instance.respError,
      'resp_msg': instance.respMsg,
      'items': instance.items,
    };

Cuti _$CutiFromJson(Map<String, dynamic> json) => Cuti(
      respError: json['resp_error'] as String?,
      respMsg: json['resp_msg'] as String?,
      cutiId: json['cuti_id'] as String?,
      pegawaiNama: json['pegawai_nama'] as String?,
      cabangNama: json['cabang_nama'] as String?,
      jabatanNama: json['jabatan_nama'] as String?,
      cutiNomor: json['cuti_nomor'] as String?,
      periode: json['periode'] as String?,
      cutiTanggal: json['cuti_tanggal'] as String?,
      jenisAbsensiNama: json['jenis_absensi_nama'] as String?,
      cutiDari: json['cuti_dari'] as String?,
      cutiSampai: json['cuti_sampai'] as String?,
      cutiKeperluan: json['cuti_keperluan'] as String?,
      cutiBukti: json['cuti_bukti'] as String?,
      cutiFile: json['cuti_file'] as String?,
      cutiStatus: json['cuti_status'] as String?,
      statusData: json['status_data'] as String?,
      cutiAlasanPenolakan: json['cuti_alasan_penolakan'] as String?,
    );

Map<String, dynamic> _$CutiToJson(Cuti instance) => <String, dynamic>{
      'resp_error': instance.respError,
      'resp_msg': instance.respMsg,
      'cuti_id': instance.cutiId,
      'pegawai_nama': instance.pegawaiNama,
      'cabang_nama': instance.cabangNama,
      'jabatan_nama': instance.jabatanNama,
      'cuti_nomor': instance.cutiNomor,
      'periode': instance.periode,
      'cuti_tanggal': instance.cutiTanggal,
      'jenis_absensi_nama': instance.jenisAbsensiNama,
      'cuti_dari': instance.cutiDari,
      'cuti_sampai': instance.cutiSampai,
      'cuti_keperluan': instance.cutiKeperluan,
      'cuti_bukti': instance.cutiBukti,
      'cuti_file': instance.cutiFile,
      'cuti_status': instance.cutiStatus,
      'status_data': instance.statusData,
      'cuti_alasan_penolakan': instance.cutiAlasanPenolakan,
    };
