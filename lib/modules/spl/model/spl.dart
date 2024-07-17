import 'package:json_annotation/json_annotation.dart';

part 'spl.g.dart';

@JsonSerializable()
class SplList {
    @JsonKey(name: "resp_error")
    bool? respError;

    @JsonKey(name: "resp_msg")
    String? respMsg;

    @JsonKey(name: "items")
    List<Spl>? items;

    SplList({
        this.respError,
        this.respMsg,
        this.items,
    });

    factory SplList.fromJson(Map<String, dynamic> json) => _$SplListFromJson(json);

    Map<String, dynamic> toJson() => _$SplListToJson(this);
}


@JsonSerializable()
class Spl {
    @JsonKey(name: "spl_id")
    String? splId;

    @JsonKey(name: "spl_nomor")
    String? splNomor;

    @JsonKey(name: "spl_tanggal")
    String? splTanggal;

    @JsonKey(name: "spl_tgl_spl")
    String? splTglSpl;

    @JsonKey(name: "spl_lama")
    String? splLama;

    @JsonKey(name: "spl_keterangan")
    String? splKeterangan;

    @JsonKey(name: "spl_status")
    String? splStatus;

    @JsonKey(name: "spl_alasan_penolakan")
    String? splAlasanPenolakan;


    Spl({
        this.splId,
        this.splNomor,
        this.splTanggal,
        this.splTglSpl,
        this.splLama,
        this.splKeterangan,
        this.splStatus,
        this.splAlasanPenolakan,
    });

    factory Spl.fromJson(Map<String, dynamic> json) => _$SplFromJson(json);

    Map<String, dynamic> toJson() => _$SplToJson(this);
}