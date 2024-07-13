import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  @JsonKey(name: "resp_error")
  bool? respError;
  @JsonKey(name: "resp_msg")
  String? respMsg;
  @JsonKey(name: "cabang_id")
  String? cabangId;
  @JsonKey(name: "cabang_nama")
  String? cabangNama;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "nama")
  String? nama;
  @JsonKey(name: "pegawai_id")
  String? pegawaiId;
  @JsonKey(name: "jabatan")
  String? jabatan;
  @JsonKey(name: "telp")
  String? telp;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "avatar")
  String? avatar;
  @JsonKey(name: "level")
  String? level;
  @JsonKey(name: "device")
  String? device;

  Account({
    this.respError,
    this.respMsg,
    this.cabangId,
    this.cabangNama,
    this.username,
    this.nama,
    this.pegawaiId,
    this.jabatan,
    this.telp,
    this.email,
    this.avatar,
    this.level,
    this.device,
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
