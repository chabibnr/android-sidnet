import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'angsuran.g.dart';

@JsonSerializable()
class AngsuranList {
  @JsonKey(name: "resp_error")
  bool? respError;

  @JsonKey(name: "resp_msg")
  String? respMsg;

  @JsonKey(name: "item")
  List<Angsuran>? items;

  AngsuranList({
    this.respError,
    this.respMsg,
    this.items,
  });

  factory AngsuranList.fromJson(Map<String, dynamic> json) => _$AngsuranListFromJson(json);

  Map<String, dynamic> toJson() => _$AngsuranListToJson(this);
}

@JsonSerializable()
class Angsuran {
  @JsonKey(name: "angsur_ke")
  String? angsurKe;

  @JsonKey(name: "angsur_bayar")
  String? angsurBayar;

  @JsonKey(name: "angsur_tmp")
  String? angsurTmp;

  @JsonKey(name: "angsur_awal")
  String? angsurAwal;

  @JsonKey(name: "angsur_pokok")
  String? angsurPokok;

  @JsonKey(name: "angsur_bunga")
  String? angsurBunga;

  @JsonKey(name: "angsur_ska")
  String? angsurSka;

  @JsonKey(name: "angsur_total")
  String? angsurTotal;

  @JsonKey(name: "angsur_status")
  String? angsurStatus;

  @JsonKey(name: "status")
  String? status;

  bool get isComplete => status == 'BAYAR';

  String get tanggalBayar {
    if (angsurBayar != null) {
      final DateFormat formatter = DateFormat('EEEE, d MMMM y', 'ID');
      return formatter.format(DateTime.parse(angsurBayar!));
    }

    return '';
  }

  String get tanggalTempo {
    if (angsurTmp != null) {
      final DateFormat formatter = DateFormat('EEEE, d MMMM y', 'ID');
      return formatter.format(DateTime.parse(angsurTmp!));
    }

    return '';
  }

  Angsuran({
    this.angsurKe,
    this.angsurBayar,
    this.angsurTmp,
    this.angsurAwal,
    this.angsurPokok,
    this.angsurBunga,
    this.angsurSka,
    this.angsurTotal,
    this.angsurStatus,
    this.status,
  });

  factory Angsuran.fromJson(Map<String, dynamic> json) => _$AngsuranFromJson(json);

  Map<String, dynamic> toJson() => _$AngsuranToJson(this);
}
