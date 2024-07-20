import 'package:chopper/chopper.dart';

part 'gaji_service.chopper.dart';

@ChopperApi(baseUrl: 'mobile')
abstract class GajiService extends ChopperService {
  @Post(path: '/listgaji')
  Future<Response> load({
    @Field('pegawai_id') required String pegawaiId,
    @Field('tahun') required String tahun,
  });

  @Post(path: '/detailgaji')
  Future<Response> view({
    @Field('gaji_id') required String id,
  });

  // additional feature

  static GajiService create([ChopperClient? client]) => _$GajiService(client);
}
