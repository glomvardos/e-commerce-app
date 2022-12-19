import 'package:dio/dio.dart';

import '../models/product.dart';
import '../dataproviders/products_dataprovider.dart';

abstract class ProductsRepositoryInterface {
  Future<List<Product>> getProducts();

  Future<Response> createProduct(Product product);
}

class ProductsRepository implements ProductsRepositoryInterface {
  final ProductsApi productsApi;
  final Dio dio;

  ProductsRepository({required this.dio}) : productsApi = ProductsApi(dio: dio);

  @override
  Future<List<Product>> getProducts() async {
    final response = await productsApi.getRawProducts();
    return List.generate(
      response.data.length,
      (index) => Product.fromJson(response.data[index]),
    );
  }

  @override
  Future<Response> createProduct(Product product) async {
    final response = await productsApi.createProduct(product);
    return response;
  }
}
