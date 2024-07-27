import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'absensi.g.dart';

@JsonSerializable()
class AbsensiList {
  @JsonKey(name: "resp_error")
  bool? respError;

  @JsonKey(name: "resp_msg")
  String? respMsg;

  @JsonKey(name: "items")
  List<Absensi>? items;

  AbsensiList({
    this.respError,
    this.respMsg,
    this.items,
  });

  factory AbsensiList.fromJson(Map<String, dynamic> json) => _$AbsensiListFromJson(json);

  Map<String, dynamic> toJson() => _$AbsensiListToJson(this);
}

@JsonSerializable()
class Absensi {
  @JsonKey(name: "resp_error")
  bool? respError;

  @JsonKey(name: "resp_msg")
  String? respMsg;

  @JsonKey(name: "pegawai_id")
  String? pegawaiId;

  @JsonKey(name: "absensi_id")
  String? absensiId;

  @JsonKey(name: "absensi_tanggal")
  String? absensiTanggal;

  @JsonKey(name: "absensi_hari")
  String? absensiHari;

  @JsonKey(name: "absensi_in")
  String? absensiIn;

  @JsonKey(name: "absensi_out")
  String? absensiOut;

  @JsonKey(name: "absensi_telat")
  String? absensiTelat;

  @JsonKey(name: "absensi_plg_cepat")
  String? absensiPlgCepat;

  @JsonKey(name: "absensi_jam_lebih")
  String? absensiJamLebih;

  @JsonKey(name: "absensi_jam_spl")
  String? absensiJamSpl;

  @JsonKey(name: "absensi_no_spl")
  String? absensiNoSpl;

  @JsonKey(name: "jenis_absensi_nama")
  String? jenisAbsensiNama;

  @JsonKey(name: "keterangan")
  String? keterangan;

  @JsonKey(name: "foto")
  String? foto;

  @JsonKey(name: "lat")
  String? lat;
  @JsonKey(name: "long")
  String? long;

  @JsonKey(name: "absensi_libur")
  bool? absensiLibur;

  Absensi({
    this.respError,
    this.respMsg,
    this.absensiId,
    this.absensiTanggal,
    this.absensiHari,
    this.absensiIn,
    this.absensiOut,
    this.absensiTelat,
    this.absensiPlgCepat,
    this.absensiJamLebih,
    this.absensiJamSpl,
    this.absensiNoSpl,
    this.jenisAbsensiNama,
    this.keterangan,
    this.absensiLibur,
    this.pegawaiId,
    this.lat,
    this.long,
    this.foto,
  });

  bool get hasOut => absensiOut != null && absensiOut!.isNotEmpty;

  bool get hasIn => absensiIn != null && absensiIn!.isNotEmpty;

  String get tanggal {
    if (date != null) {
      final DateFormat formatter = DateFormat('d MMMM y', 'ID');
      return formatter.format(date!);
    }

    return '';
  }

  bool get showDescription {
    if ((jenisAbsensiNama != null && jenisAbsensiNama!.isNotEmpty) || (keterangan != null && keterangan!.isNotEmpty)) {
      return true;
    }
    return false;
  }

  DateTime? get date {
    if (absensiTanggal != null) {
      return DateTime.parse(absensiTanggal!);
    }
    return null;
  }

  factory Absensi.fromJson(Map<String, dynamic> json) => _$AbsensiFromJson(json);

  Map<String, dynamic> toJson() => _$AbsensiToJson(this);
}
