import 'package:json_annotation/json_annotation.dart';

part 'gaji.g.dart';

@JsonSerializable()
class GajiList {
  @JsonKey(name: "resp_error")
  bool? respError;

  @JsonKey(name: "resp_msg")
  String? respMsg;

  @JsonKey(name: "items")
  List<Gaji>? items;

  GajiList({
    this.respError,
    this.respMsg,
    this.items,
  });

  factory GajiList.fromJson(Map<String, dynamic> json) => _$GajiListFromJson(json);

  Map<String, dynamic> toJson() => _$GajiListToJson(this);
}

@JsonSerializable()
class DetailGaji {
  @JsonKey(name: "resp_error")
  bool? respError;

  @JsonKey(name: "resp_msg")
  String? respMsg;

  @JsonKey(name: "pegawai_nama")
  String? pegawaiNama;

  @JsonKey(name: "cabang_nama")
  String? cabangNama;

  @JsonKey(name: "jabatan_nama")
  String? jabatanNama;

  @JsonKey(name: "gaji_masuk")
  String? gajiMasuk;

  @JsonKey(name: "gaji_tidak_masuk")
  String? gajiTidakMasuk;

  @JsonKey(name: "masakerja")
  String? masakerja;

  @JsonKey(name: "no_rekening")
  String? noRekening;

  @JsonKey(name: "nama_bank")
  String? namaBank;

  @JsonKey(name: "item")
  Gaji? gaji;

  DetailGaji({
    this.respError,
    this.respMsg,
    this.pegawaiNama,
    this.cabangNama,
    this.jabatanNama,
    this.gajiMasuk,
    this.gajiTidakMasuk,
    this.masakerja,
    this.noRekening,
    this.namaBank,
  });

  factory DetailGaji.fromJson(Map<String, dynamic> json) => _$DetailGajiFromJson(json);

  Map<String, dynamic> toJson() => _$DetailGajiToJson(this);
}

@JsonSerializable()
class Gaji {
  @JsonKey(name: "gaji_id")
  String? gajiId;

  @JsonKey(name: "gaji_periode")
  String? gajiPeriode;

  @JsonKey(name: "gaji_pokok")
  String? gajiPokok;

  @JsonKey(name: "gaji_bruto")
  String? gajiBruto;

  @JsonKey(name: "gaji_total_pot")
  String? gajiTotalPot;

  @JsonKey(name: "gaji_netto")
  String? gajiNetto;

  @JsonKey(name: "gaji_posting")
  String? gajiPosting;

  @JsonKey(name: "gaji_biaya_admin")
  String? gajiBiayaAdmin;

  @JsonKey(name: "gaji_buka_rekening")
  String? gajiBukaRekening;

  @JsonKey(name: "gaji_jam_lembur")
  String? gajiJamLembur;

  @JsonKey(name: "gaji_lembur")
  String? gajiLembur;
 
  @JsonKey(name: "gaji_tunj_hadir")
  String? gajiTunjHadir;

  @JsonKey(name: "gaji_tunj_insentif")
  String? gajiTunjInsentif;

  @JsonKey(name: "gaji_tunj_makan")
  String? gajiTunjMakan;

  @JsonKey(name: "gaji_tunj_lain")
  String? gajiTunjLain;

  @JsonKey(name: "gaji_pot_kesehatan")
  String? gajiPotKesehatan;

  @JsonKey(name: "gaji_pot_tenagakerja")
  String? gajiPotTenagakerja;

  @JsonKey(name: "gaji_menittelat")
  String? gajiMenittelat;

  @JsonKey(name: "gaji_pot_telat")
  String? gajiPotTelat;

  @JsonKey(name: "gaji_pot_absensi")
  String? gajiPotAbsensi;

  @JsonKey(name: "gaji_pot_sangsi")
  String? gajiPotSangsi;

  @JsonKey(name: "gaji_pot_denda")
  String? gajiPotDenda;

  @JsonKey(name: "gaji_pot_angsuran")
  String? gajiPotAngsuran;

  @JsonKey(name: "gaji_pot_lain")
  String? gajiPotLain;

  Gaji({
    this.gajiId,
    this.gajiPeriode,
    this.gajiPokok,
    this.gajiBruto,
    this.gajiTotalPot,
    this.gajiNetto,
    this.gajiPosting,
    this.gajiBiayaAdmin,
    this.gajiBukaRekening,
    this.gajiJamLembur,
    this.gajiLembur,
    this.gajiTunjHadir,
    this.gajiTunjInsentif,
    this.gajiTunjMakan,
    this.gajiTunjLain,
    this.gajiPotKesehatan,
    this.gajiPotTenagakerja,
    this.gajiMenittelat,
    this.gajiPotTelat,
    this.gajiPotAbsensi,
    this.gajiPotSangsi,
    this.gajiPotDenda,
    this.gajiPotAngsuran,
    this.gajiPotLain,
  });

  factory Gaji.fromJson(Map<String, dynamic> json) => _$GajiFromJson(json);

  Map<String, dynamic> toJson() => _$GajiToJson(this);
}
