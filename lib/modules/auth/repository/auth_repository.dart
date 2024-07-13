import 'package:app/app.dart';
import 'package:app/modules/auth/model/auth.dart';
import 'package:app/modules/auth/service/auth_service.dart';

class AuthRepository {
  final _service = App.I.chopper.getService<AuthService>();

  Future<Auth> login(String username, String password) async {
    try {
      var response = await _service.login(username, password);
      if (response.statusCode == 401) {
        throw Error();
      }
      return Auth.fromJson(response.body);
    } catch (e) {
      throw Exception('Failed to login');
    }
  }
}
