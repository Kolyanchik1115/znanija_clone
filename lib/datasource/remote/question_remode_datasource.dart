import 'package:dio/dio.dart';
import 'package:znanija_clone/common/config.dart';
import 'package:znanija_clone/models/category_model.dart';
import 'package:znanija_clone/models/question_model.dart';

class QuestionClient {
  final _dio = Dio();
  final _host = Config.host;

  Future<QuestionList> getQuestions(
      int? categoryId, bool? isAnswered, int limit, int page) async {
    final response = await _dio.get('$_host/question', queryParameters: {
      'categoryId': categoryId,
      'isAnswered': isAnswered,
      'limit': limit,
      'page': page,
    });
    if (response.statusCode == 200) {
      return QuestionList.fromJson(response.data);
    } else {
      throw Exception('Failed to load questions');
    }
  }

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
