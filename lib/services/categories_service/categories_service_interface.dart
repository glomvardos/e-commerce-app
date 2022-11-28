part of 'categories_service.dart';

abstract class CategoriesService {
  Future<List<Category>> getCategories();
}
