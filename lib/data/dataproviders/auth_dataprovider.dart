import 'package:dio/dio.dart';

class AuthApi {
  final Dio dio;

  AuthApi({required this.dio});

  Future<Response> register({
    required String username,
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  }) async {
    return dio.post('/users/user/', data: {
      "username": username,
      "first_name": firstname,
      "last_name": lastname,
      "email": email,
      "user_role": "CUSTOMER",
      "password": password
    });
  }
}
