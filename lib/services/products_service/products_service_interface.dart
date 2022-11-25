part of 'products_service.dart';

abstract class ProductsService {
  Future<List<Product>> getProducts();

  Future<Response> createProduct(Product product);
}
