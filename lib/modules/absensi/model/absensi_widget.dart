import 'package:json_annotation/json_annotation.dart';

part 'absensi_widget.g.dart';

@JsonSerializable()
class AbsensiWidget {
  @JsonKey(name: "resp_error")
  bool? respError;

  @JsonKey(name: "resp_msg")
  String? respMsg;

  @JsonKey(name: "masuk")
  int? masuk;

  @JsonKey(name: "tidakmasuk")
  int? tidakmasuk;

  @JsonKey(name: "cuti")
  int? cuti;

  @JsonKey(name: "alpha")
  int? alpha;

  @JsonKey(name: "absensi_in")
  String? absensiIn;

  @JsonKey(name: "absensi_out")
  String? absensiOut;

  AbsensiWidget({
    this.respError,
    this.respMsg,
    this.masuk,
    this.tidakmasuk,
    this.cuti,
    this.alpha,
    this.absensiIn,
    this.absensiOut,
  });

  factory AbsensiWidget.fromJson(Map<String, dynamic> json) => _$AbsensiWidgetFromJson(json);

  Map<String, dynamic> toJson() => _$AbsensiWidgetToJson(this);
}
