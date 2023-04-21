import 'package:dio/dio.dart';
import 'package:znanija_clone/common/config.dart';
import 'package:znanija_clone/models/category_model.dart';

class CategoryClient {
  final _dio = Dio();
  final _host = Config.host;

  Future<List<Categories>> getCategories() async {
    try {
      final response = await _dio.get('$_host/category');
      if (response.statusCode == 200) {
        final categoriesJson = response.data as List;
        return categoriesJson.map((json) => Categories.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      rethrow;
    }
  }
}
