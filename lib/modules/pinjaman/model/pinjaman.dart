import 'package:json_annotation/json_annotation.dart';

part 'pinjaman.g.dart';

@JsonSerializable()
class PinjamanList {
    @JsonKey(name: "resp_error")
    bool? respError;

    @JsonKey(name: "resp_msg")
    String? respMsg;

    @JsonKey(name: "items")
    List<Pinjaman>? items;

    PinjamanList({
        this.respError,
        this.respMsg,
        this.items,
    });

    factory PinjamanList.fromJson(Map<String, dynamic> json) => _$PinjamanListFromJson(json);

    Map<String, dynamic> toJson() => _$PinjamanListToJson(this);
}


@JsonSerializable()
class Pinjaman {
    @JsonKey(name: "pinjaman_id")
    String? pinjamanId;

    @JsonKey(name: "pinjaman_code")
    String? pinjamanCode;

    @JsonKey(name: "pinjaman_date")
    String? pinjamanDate;

    @JsonKey(name: "pinjaman_tipe")
    String? pinjamanTipe;

    @JsonKey(name: "pinjaman_jk")
    String? pinjamanJk;

    @JsonKey(name: "pinjaman_total")
    String? pinjamanTotal;

    @JsonKey(name: "pinjaman_status")
    String? pinjamanStatus;

    @JsonKey(name: "status")
    String? status;


    Pinjaman({
        this.pinjamanId,
        this.pinjamanCode,
        this.pinjamanDate,
        this.pinjamanTipe,
        this.pinjamanJk,
        this.pinjamanTotal,
        this.pinjamanStatus,
        this.status,
    });

    factory Pinjaman.fromJson(Map<String, dynamic> json) => _$PinjamanFromJson(json);

    Map<String, dynamic> toJson() => _$PinjamanToJson(this);
}