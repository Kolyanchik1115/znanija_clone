import 'dart:io';

import 'package:dio/dio.dart';
import 'package:znanija_clone/core/resources/app_config.dart';
import 'package:znanija_clone/data/datasource/locale/auth_locale_datasource.dart';
import 'package:znanija_clone/data/models/answer_model.dart';

class AnswerClient {
  final _dio = Dio();
  final _host = Config.host;

  Future<Answer> addAnswer(String text, int questionId, List<File> files) async {
    final token = await AuthenticateLocalData().getToken();
    try {
      final formData = FormData.fromMap({
        'text': text,
        'questionId': questionId,
      });

      for (var file in files) {
        formData.files.add(MapEntry(
          'files',
          await MultipartFile.fromFile(file.path, filename: 'selected_file'),
        ));
      }

      final response = await _dio.post('$_host/answer',
          data: formData,
          options: Options(
            contentType: Headers.jsonContentType,
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $token',
            },
          ));

      return Answer.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
