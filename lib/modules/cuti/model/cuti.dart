import 'package:json_annotation/json_annotation.dart';

part 'cuti.g.dart';

@JsonSerializable()
class CutiList {
  @JsonKey(name: "resp_error")
  bool? respError;

  @JsonKey(name: "resp_msg")
  String? respMsg;

  @JsonKey(name: "items")
  List<Cuti>? items;

  CutiList({
    this.respError,
    this.respMsg,
    this.items,
  });

  factory CutiList.fromJson(Map<String, dynamic> json) => _$CutiListFromJson(json);

  Map<String, dynamic> toJson() => _$CutiListToJson(this);
}

@JsonSerializable()
class Cuti {
  @JsonKey(name: "resp_error")
  String? respError;

  @JsonKey(name: "resp_msg")
  String? respMsg;

  @JsonKey(name: "cuti_id")
  String? cutiId;

  @JsonKey(name: "pegawai_nama")
  String? pegawaiNama;

  @JsonKey(name: "cabang_nama")
  String? cabangNama;

  @JsonKey(name: "jabatan_nama")
  String? jabatanNama;

  @JsonKey(name: "cuti_nomor")
  String? cutiNomor;

  @JsonKey(name: "periode")
  String? periode;

  @JsonKey(name: "cuti_tanggal")
  String? cutiTanggal;

  @JsonKey(name: "jenis_absensi_nama")
  String? jenisAbsensiNama;

  @JsonKey(name: "cuti_dari")
  String? cutiDari;

  @JsonKey(name: "cuti_sampai")
  String? cutiSampai;

  @JsonKey(name: "cuti_keperluan")
  String? cutiKeperluan;

  @JsonKey(name: "cuti_bukti")
  String? cutiBukti;

  @JsonKey(name: "cuti_file")
  String? cutiFile;

  @JsonKey(name: "cuti_status")
  String? cutiStatus;

  @JsonKey(name: "status_data")
  String? statusData;

  @JsonKey(name: "cuti_alasan_penolakan")
  String? cutiAlasanPenolakan;

  bool get hasReason => cutiAlasanPenolakan != null && cutiAlasanPenolakan!.isNotEmpty;

  Cuti({
    this.respError,
    this.respMsg,
    this.cutiId,
    this.pegawaiNama,
    this.cabangNama,
    this.jabatanNama,
    this.cutiNomor,
    this.periode,
    this.cutiTanggal,
    this.jenisAbsensiNama,
    this.cutiDari,
    this.cutiSampai,
    this.cutiKeperluan,
    this.cutiBukti,
    this.cutiFile,
    this.cutiStatus,
    this.statusData,
    this.cutiAlasanPenolakan,
  });

  factory Cuti.fromJson(Map<String, dynamic> json) => _$CutiFromJson(json);

  Map<String, dynamic> toJson() => _$CutiToJson(this);
}
