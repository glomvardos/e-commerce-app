import 'package:dio/dio.dart';

import '../dataproviders/auth_dataprovider.dart';

abstract class AuthRepositoryService {}

class AuthRepository implements AuthRepositoryService {
  final AuthApi authApi;
  final Dio dio;

  AuthRepository({required this.dio}) : authApi = AuthApi(dio: dio);
}
