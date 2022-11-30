import 'package:dio/dio.dart';
import '../models/product.dart';

class ProductsApi {
  final Dio dio;

  ProductsApi({required this.dio});

  Future<Response> getRawProducts() async {
    return dio.get('/products/product/');
  }

  Future<Response> createProduct(Product product) async {
    return dio.post('/products/product/', data: product.toJson());
  }
}
