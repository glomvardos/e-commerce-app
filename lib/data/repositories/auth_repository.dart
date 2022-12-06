import 'package:dio/dio.dart';

import '../dataproviders/auth_dataprovider.dart';

abstract class AuthRepositoryService {
  Future<Response> register({
    required String username,
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  });
}

class AuthRepository implements AuthRepositoryService {
  final AuthApi authApi;
  final Dio dio;

  AuthRepository({required this.dio}) : authApi = AuthApi(dio: dio);

  @override
  Future<Response> register({
    required String username,
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  }) async {
    final Response response = await authApi.register(
      username: username,
      firstname: firstname,
      lastname: lastname,
      email: email,
      password: password,
    );

    return response;
  }
}
