import 'package:chopper/chopper.dart';

part 'account_service.chopper.dart';

@ChopperApi(baseUrl: 'mobile')
abstract class AccountService extends ChopperService {
  @Post(path: '/profil', optionalBody: true)
  Future<Response> profile();

  static AccountService create([ChopperClient? client]) =>
      _$AccountService(client);
}
