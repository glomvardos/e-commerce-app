import 'package:dio/dio.dart';

class CategoriesApi {
  final Dio dio;

  CategoriesApi({required this.dio});

  Future<Response> getRawCategories() async {
    return dio.get('/products/category/');
  }
}