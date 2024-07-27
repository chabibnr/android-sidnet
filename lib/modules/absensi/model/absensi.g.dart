// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absensi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbsensiList _$AbsensiListFromJson(Map<String, dynamic> json) => AbsensiList(
      respError: json['resp_error'] as bool?,
      respMsg: json['resp_msg'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Absensi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AbsensiListToJson(AbsensiList instance) =>
    <String, dynamic>{
      'resp_error': instance.respError,
      'resp_msg': instance.respMsg,
      'items': instance.items,
    };

Absensi _$AbsensiFromJson(Map<String, dynamic> json) => Absensi(
      respError: json['resp_error'] as bool?,
      respMsg: json['resp_msg'] as String?,
      absensiId: json['absensi_id'] as String?,
      absensiTanggal: json['absensi_tanggal'] as String?,
      absensiHari: json['absensi_hari'] as String?,
      absensiIn: json['absensi_in'] as String?,
      absensiOut: json['absensi_out'] as String?,
      absensiTelat: json['absensi_telat'] as String?,
      absensiPlgCepat: json['absensi_plg_cepat'] as String?,
      absensiJamLebih: json['absensi_jam_lebih'] as String?,
      absensiJamSpl: json['absensi_jam_spl'] as String?,
      absensiNoSpl: json['absensi_no_spl'] as String?,
      jenisAbsensiNama: json['jenis_absensi_nama'] as String?,
      keterangan: json['keterangan'] as String?,
      absensiLibur: json['absensi_libur'] as bool?,
      pegawaiId: json['pegawai_id'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      foto: json['foto'] as String?,
    );

Map<String, dynamic> _$AbsensiToJson(Absensi instance) => <String, dynamic>{
      'resp_error': instance.respError,
      'resp_msg': instance.respMsg,
      'pegawai_id': instance.pegawaiId,
      'absensi_id': instance.absensiId,
      'absensi_tanggal': instance.absensiTanggal,
      'absensi_hari': instance.absensiHari,
      'absensi_in': instance.absensiIn,
      'absensi_out': instance.absensiOut,
      'absensi_telat': instance.absensiTelat,
      'absensi_plg_cepat': instance.absensiPlgCepat,
      'absensi_jam_lebih': instance.absensiJamLebih,
      'absensi_jam_spl': instance.absensiJamSpl,
      'absensi_no_spl': instance.absensiNoSpl,
      'jenis_absensi_nama': instance.jenisAbsensiNama,
      'keterangan': instance.keterangan,
      'foto': instance.foto,
      'lat': instance.lat,
      'long': instance.long,
      'absensi_libur': instance.absensiLibur,
    };
