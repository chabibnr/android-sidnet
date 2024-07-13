import 'package:chopper/chopper.dart';

part 'absensi_service.chopper.dart';

@ChopperApi(baseUrl: 'mobile')
abstract class AbsensiService extends ChopperService {
  @Post(path: '/listabsensi', optionalBody: true)
  Future<Response> load({
    @Field('pegawai_id') required String pegawaiId,
    @Field('bulan') required String bulan,
    @Field('tahun') required String tahun,
  });

  @Post(path: '/dashboard', optionalBody: true)
  Future<Response> widget({
    @Field('pegawai_id') required String pegawaiId,
  });

  @Post(path: '/view', optionalBody: true)
  Future<Response> view();

  @Post(path: '/add', optionalBody: true)
  Future<Response> add();

  @Post(path: '/update', optionalBody: true)
  Future<Response> update();

  @Post(path: '/delete', optionalBody: true)
  Future<Response> delete();

  // additional feature

  static AbsensiService create([ChopperClient? client]) => _$AbsensiService(client);
}
