import 'package:dio/dio.dart';

import '../../config.dart';

part 'auth_service_interface.dart';
part 'auth_exception.dart';

class AuthServiceApi implements AuthService {
  final Dio _client = Dio(BaseOptions(
    baseUrl: Config.apiBaseUrl,
  ));

  get client => _client;
}