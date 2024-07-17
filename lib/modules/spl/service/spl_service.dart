import 'package:chopper/chopper.dart';

part 'spl_service.chopper.dart';

@ChopperApi(baseUrl: 'mobile')
abstract class SplService extends ChopperService {
  @Post(path: '/listspl', optionalBody: true)
  Future<Response> load({
    @Field('pegawai_id') required String pegawaiId,
    @Field('bulan') required String bulan,
    @Field('tahun') required String tahun,
  });

  @Post(path: '/view', optionalBody: true)
  Future<Response> view();

  @Post(path: '/simpanspl', optionalBody: true)
  Future<Response> add();

  @Post(path: '/update', optionalBody: true)
  Future<Response> update();

  @Post(path: '/delete', optionalBody: true)
  Future<Response> delete();

  // additional feature

  static SplService create([ChopperClient? client]) => _$SplService(client);
}
