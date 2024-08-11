// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gaji.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GajiList _$GajiListFromJson(Map<String, dynamic> json) => GajiList(
      respError: json['resp_error'] as bool?,
      respMsg: json['resp_msg'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Gaji.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GajiListToJson(GajiList instance) => <String, dynamic>{
      'resp_error': instance.respError,
      'resp_msg': instance.respMsg,
      'items': instance.items,
    };

DetailGaji _$DetailGajiFromJson(Map<String, dynamic> json) => DetailGaji(
      respError: json['resp_error'] as bool?,
      respMsg: json['resp_msg'] as String?,
      pegawaiNama: json['pegawai_nama'] as String?,
      cabangNama: json['cabang_nama'] as String?,
      jabatanNama: json['jabatan_nama'] as String?,
      gajiMasuk: json['gaji_masuk'] as String?,
      gajiTidakMasuk: json['gaji_tidak_masuk'] as String?,
      masakerja: json['masakerja'] as String?,
      noRekening: json['no_rekening'] as String?,
      namaBank: json['nama_bank'] as String?,
    )
      ..periode = json['periode'] as String?
      ..slipGaji = json['slip_gaji'] as String?
      ..gaji = json['item'] == null
          ? null
          : Gaji.fromJson(json['item'] as Map<String, dynamic>);

Map<String, dynamic> _$DetailGajiToJson(DetailGaji instance) =>
    <String, dynamic>{
      'resp_error': instance.respError,
      'resp_msg': instance.respMsg,
      'pegawai_nama': instance.pegawaiNama,
      'cabang_nama': instance.cabangNama,
      'jabatan_nama': instance.jabatanNama,
      'gaji_masuk': instance.gajiMasuk,
      'gaji_tidak_masuk': instance.gajiTidakMasuk,
      'masakerja': instance.masakerja,
      'no_rekening': instance.noRekening,
      'nama_bank': instance.namaBank,
      'periode': instance.periode,
      'slip_gaji': instance.slipGaji,
      'item': instance.gaji,
    };

Gaji _$GajiFromJson(Map<String, dynamic> json) => Gaji(
      gajiId: json['gaji_id'] as String?,
      gajiPeriode: json['gaji_periode'] as String?,
      gajiPokok: json['gaji_pokok'] as String?,
      gajiBruto: json['gaji_bruto'] as String?,
      gajiTotalPot: json['gaji_total_pot'] as String?,
      gajiNetto: json['gaji_netto'] as String?,
      gajiPosting: json['gaji_posting'] as String?,
      gajiBiayaAdmin: json['gaji_biaya_admin'] as String?,
      gajiBukaRekening: json['gaji_buka_rekening'] as String?,
      gajiJamLembur: json['gaji_jam_lembur'] as String?,
      gajiLembur: json['gaji_lembur'] as String?,
      gajiTunjHadir: json['gaji_tunj_hadir'] as String?,
      gajiTunjInsentif: json['gaji_tunj_insentif'] as String?,
      gajiTunjMakan: json['gaji_tunj_makan'] as String?,
      gajiTunjLain: json['gaji_tunj_lain'] as String?,
      gajiPotKesehatan: json['gaji_pot_kesehatan'] as String?,
      gajiPotTenagakerja: json['gaji_pot_tenagakerja'] as String?,
      gajiMenittelat: json['gaji_menittelat'] as String?,
      gajiPotTelat: json['gaji_pot_telat'] as String?,
      gajiPotAbsensi: json['gaji_pot_absensi'] as String?,
      gajiPotSangsi: json['gaji_pot_sangsi'] as String?,
      gajiPotDenda: json['gaji_pot_denda'] as String?,
      gajiPotAngsuran: json['gaji_pot_angsuran'] as String?,
      gajiPotLain: json['gaji_pot_lain'] as String?,
    );

Map<String, dynamic> _$GajiToJson(Gaji instance) => <String, dynamic>{
      'gaji_id': instance.gajiId,
      'gaji_periode': instance.gajiPeriode,
      'gaji_pokok': instance.gajiPokok,
      'gaji_bruto': instance.gajiBruto,
      'gaji_total_pot': instance.gajiTotalPot,
      'gaji_netto': instance.gajiNetto,
      'gaji_posting': instance.gajiPosting,
      'gaji_biaya_admin': instance.gajiBiayaAdmin,
      'gaji_buka_rekening': instance.gajiBukaRekening,
      'gaji_jam_lembur': instance.gajiJamLembur,
      'gaji_lembur': instance.gajiLembur,
      'gaji_tunj_hadir': instance.gajiTunjHadir,
      'gaji_tunj_insentif': instance.gajiTunjInsentif,
      'gaji_tunj_makan': instance.gajiTunjMakan,
      'gaji_tunj_lain': instance.gajiTunjLain,
      'gaji_pot_kesehatan': instance.gajiPotKesehatan,
      'gaji_pot_tenagakerja': instance.gajiPotTenagakerja,
      'gaji_menittelat': instance.gajiMenittelat,
      'gaji_pot_telat': instance.gajiPotTelat,
      'gaji_pot_absensi': instance.gajiPotAbsensi,
      'gaji_pot_sangsi': instance.gajiPotSangsi,
      'gaji_pot_denda': instance.gajiPotDenda,
      'gaji_pot_angsuran': instance.gajiPotAngsuran,
      'gaji_pot_lain': instance.gajiPotLain,
    };
