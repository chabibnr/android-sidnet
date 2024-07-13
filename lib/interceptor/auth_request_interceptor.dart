import 'dart:async';

import 'package:app/app.dart';
import 'package:chopper/chopper.dart';

class AuthRequestInterceptor implements Interceptor {
  //todo delete
  FutureOr<Request> onRequest(Request request) async {
    var headers = Map<String, String>.from(request.headers);
    headers['key'] = 'hrd.sidnet';
    final token = App.I.session.getToken();
    if (token.isNotEmpty) {
      headers['username'] = token;
    }
    return request.copyWith(headers: headers);
  }

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) {
    var headers = Map<String, String>.from(chain.request.headers);
    headers['key'] = 'hrd.sidnet';
    final token = App.I.session.getToken();
    if (token.isNotEmpty) {
      headers['username'] = token;
    }
    final request = applyHeaders(chain.request, headers);
    return chain.proceed(request);
  }
}
