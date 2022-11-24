part of 'products_service.dart';

abstract class ProductsService {
  Future<Response> createProduct(Product product);
}
