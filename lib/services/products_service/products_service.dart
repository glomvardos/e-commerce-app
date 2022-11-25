import 'package:dio/dio.dart';
import '../../models/product.dart';

part 'products_service_interface.dart';

class ProductsApiService implements ProductsService {
  final Dio dio;

  ProductsApiService({required this.dio});

  @override
  Future<List<Product>> getProducts() async {
    final response = await dio.get('/products/products/');
    return List.generate(
      response.data.length,
          (index) => Product.fromJson(response.data[index]),
    );
  }

  @override
  Future<Response> createProduct(Product product) async {
    try {
      final response =
      await dio.post('/products/products/', data: product.toJson());
      return response;
    } on DioError {
      rethrow;
    }
  }
}
