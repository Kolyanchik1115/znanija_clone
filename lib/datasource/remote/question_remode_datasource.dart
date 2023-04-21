import 'package:dio/dio.dart';
import 'package:znanija_clone/common/config.dart';
import 'package:znanija_clone/models/question_model.dart';

class QuetionClient {
  final _dio = Dio();
  final _host = Config().host;

  Future<QuestionList> getQuestions(
    int categoryId,
    bool isAnswered,
    int limit,
    int page,
  ) async {
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
}
