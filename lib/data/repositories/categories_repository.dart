import 'package:dio/dio.dart';

import '../dataproviders/categories_dataprovider.dart';

import '../models/category.dart';

abstract class CategoriesRepositoryService {
  Future<List<Category>> getCategories();
}

class CategoriesRepository implements CategoriesRepositoryService {
  final CategoriesApi categoriesApi;
  final Dio dio;

  CategoriesRepository({required this.dio})
      : categoriesApi = CategoriesApi(dio: dio);

  @override
  Future<List<Category>> getCategories() async {
    final response = await categoriesApi.getRawCategories();
    return List.generate(
      response.data.length,
      (index) => Category.fromJson(response.data[index]),
    );
  }
}
