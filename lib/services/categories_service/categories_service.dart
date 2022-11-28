import 'package:dio/dio.dart';

import '../../models/category.dart';

part 'categories_service_interface.dart';

class CategoriesApiService implements CategoriesService {
  final Dio dio;

  CategoriesApiService({required this.dio});

  @override
  Future<List<Category>> getCategories() async {
    final response = await dio.get('/products/category/');
    return List.generate(
      response.data.length,
      (index) => Category.fromJson(
        response.data[index],
      ),
    );
  }
}
