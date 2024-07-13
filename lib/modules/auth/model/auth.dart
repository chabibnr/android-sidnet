import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class Auth {
  @JsonKey(name: "resp_error")
  bool respError;
  @JsonKey(name: "resp_msg")
  String respMsg;
  @JsonKey(name: "cabang_id")
  String cabangId;
  @JsonKey(name: "cabang_nama")
  String cabangNama;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "nama")
  String nama;
  @JsonKey(name: "pegawai_id")
  String pegawaiId;
  @JsonKey(name: "jabatan")
  String jabatan;
  @JsonKey(name: "telp")
  String telp;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "avatar")
  String avatar;
  @JsonKey(name: "level")
  String level;
  @JsonKey(name: "device")
  String device;

  Auth({
    required this.respError,
    required this.respMsg,
    required this.cabangId,
    required this.cabangNama,
    required this.username,
    required this.nama,
    required this.pegawaiId,
    required this.jabatan,
    required this.telp,
    required this.email,
    required this.avatar,
    required this.level,
    required this.device,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
