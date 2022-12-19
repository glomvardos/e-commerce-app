import 'package:dio/dio.dart';

import '../dataproviders/categories_dataprovider.dart';

import '../models/category.dart';

abstract class CategoriesRepositoryInterface {
  Future<List<Category>> getCategories();
}

class CategoriesRepository implements CategoriesRepositoryInterface {
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
