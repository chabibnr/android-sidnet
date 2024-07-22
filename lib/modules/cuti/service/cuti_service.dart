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
  Future<Response> view();

  @Post(path: '/simpancuti', optionalBody: true)
  Future<Response> add();

  @Post(path: '/updatecuti', optionalBody: true)
  Future<Response> update();

  @Post(path: '/delete', optionalBody: true)
  Future<Response> delete();

  // additional feature

  static CutiService create([ChopperClient? client]) => _$CutiService(client);
}
