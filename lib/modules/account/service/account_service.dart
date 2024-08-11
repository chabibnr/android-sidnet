import 'package:chopper/chopper.dart';

part 'account_service.chopper.dart';

@ChopperApi(baseUrl: 'mobile')
abstract class AccountService extends ChopperService {
  @Post(path: '/profil', optionalBody: true)
  Future<Response> profile();

  @Post(
    path: '/updateavatar',
    headers: {"Content-Type": "multipart/formdata"},
  )
  @multipart
  Future<Response> avatar({
    @PartFile('foto') required String photo,
  });

  @Post(path: '/gantipassword')
  Future<Response> password({
    @Field('password') required String password,
    @Field('konfirm') required String confirmPassword,
  });

  static AccountService create([ChopperClient? client]) => _$AccountService(client);
}
