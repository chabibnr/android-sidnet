import 'package:chopper/chopper.dart';

part 'cuti_service.chopper.dart';

@ChopperApi(baseUrl: 'mobile')
abstract class CutiService extends ChopperService {
  @Post(path: '/listcuti', optionalBody: true)
  Future<Response> load({
    @Field('pegawai_id') required String pegawaiId,
    @Field('bulan') required String bulan,
    @Field('tahun') required String tahun,
  });

  @Post(path: '/detailcuti', optionalBody: true)
  Future<Response> view({
    @Field('cuti_id') required String id,
  });

  @Post(
    path: '/simpancuti',
    headers: {"Content-Type": "multipart/formdata"},
  )
  @multipart
  Future<Response> add({
    @Part('pegawai_id') required String pegawaiId,
    @Part('jenis_absensi_id') required String jenisCutiId,
    @Part('tgl_dari') required String since,
    @Part('tgl_sampai') required String until,
    @Part('keperluan') required String keperluan,
    @PartFile('file') required String? filePath,
  });

  @Post(path: '/updatecuti', optionalBody: true)
  Future<Response> update();

  @Post(path: '/delete', optionalBody: true)
  Future<Response> delete();

  @Post(path: '/listjenisabsensi', optionalBody: true)
  Future<Response> jenisCuti();

  // additional feature

  static CutiService create([ChopperClient? client]) => _$CutiService(client);
}
