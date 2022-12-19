import 'package:dio/dio.dart';
import '../../config.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: Config.apiBaseUrl,
  ));

  get client => _dio;
}
