import 'package:chopper/chopper.dart';

part 'auth_service.chopper.dart';

@ChopperApi(baseUrl: 'mobile')
abstract class AuthService extends ChopperService {
  @Post(path: '/login')
  Future<Response> login(
    @Field('username') String username,
    @Field('password') String password,
  );

  static AuthService create([ChopperClient? client]) => _$AuthService(client);
}
