import 'package:dio/dio.dart';

class AuthApi {
  final Dio client;

  AuthApi({required this.client});

  Future<Response> login(
      {required String username, required String password}) async {
    return client
        .post('/login/', data: {"username": username, "password": password});
  }

  Future<Response> register({
    required String username,
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  }) async {
    return client.post('/users/user/', data: {
      "username": username,
      "first_name": firstname,
      "last_name": lastname,
      "email": email,
      "user_role": "CUSTOMER",
      "password": password
    });
  }

  Future<Response> getAuthUser() async {
    return client.get('/users/user/me/');
  }
}
