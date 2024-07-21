import 'package:chopper/chopper.dart';

part 'pinjaman_service.chopper.dart';

@ChopperApi(baseUrl: 'mobile')
abstract class PinjamanService extends ChopperService {
  @Post(path: '/listpinjaman')
  Future<Response> load({
    @Field('pegawai_id') required String pegawaiId,
    @Field('tahun') required String tahun,
  });

  @Post(path: '/detailpinjaman', optionalBody: true)
  Future<Response> view({
    @Field('pinjaman_id') required String id,
  });

  // additional feature

  static PinjamanService create([ChopperClient? client]) => _$PinjamanService(client);
}
