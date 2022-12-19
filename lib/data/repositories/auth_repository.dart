import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dataproviders/auth_dataprovider.dart';

abstract class AuthRepositoryInterface {
  Future<String?> login({
    required String username,
    required String password,
  });

  Future<Response> register({
    required String username,
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  });
}

class AuthRepository implements AuthRepositoryInterface {
  final AuthApi authApi;
  final Dio client;

  AuthRepository({required this.client}) : authApi = AuthApi(client: client);

  @override
  Future<String?> login(
      {required String username, required String password}) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    final response =
    await authApi.login(username: username, password: password);
    final token = response.data['access'];

    if (token != null) {
      await sharedPrefs.setString('accessToken', token);
      client.options.headers['Authorization'] = 'Bearer $token';
      return token;
    }
    return null;
  }

  @override
  Future<Response> register({
    required String username,
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  }) async {
    return await authApi.register(
      username: username,
      firstname: firstname,
      lastname: lastname,
      email: email,
      password: password,
    );
  }
}
