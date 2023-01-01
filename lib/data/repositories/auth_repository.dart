import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dataproviders/auth_dataprovider.dart';
import '../models/user.dart';

abstract class AuthRepositoryInterface {
  Future<User?> login({
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

  Future<User> getAuthUser();
}

class AuthRepository implements AuthRepositoryInterface {
  final AuthApi authApi;
  final Dio client;

  AuthRepository({required this.client}) : authApi = AuthApi(client: client);

  @override
  Future<User?> login(
      {required String username, required String password}) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    final response =
        await authApi.login(username: username, password: password);
    final token = response.data['access'];

    if (token != null) {
      await sharedPrefs.setString('accessToken', token);
      client.options.headers['Authorization'] = 'Bearer $token';

      //Get logged in user
      final user = await getAuthUser();

      return user;
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

  @override
  Future<User> getAuthUser() async {
    try {
      final SharedPreferences sharedPrefs =
          await SharedPreferences.getInstance();
      final response = await authApi.getAuthUser();
      final user = User.fromJson(response.data);
      await sharedPrefs.setString('user', json.encode(user.toJson()));
      return user;
    } on DioError {
      rethrow;
    }
  }
}
