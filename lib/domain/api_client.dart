import 'dart:convert';
import 'dart:io';
import 'package:znanija_clone/config/config.dart';

class ApiClient {
  final _client = HttpClient();

  Uri _makeUri(String path) {
    final uri = Uri.parse('${Config.host}$path');
    return uri;
  }

  Future<String> signUp({
    required String email,
    required String password,
    required String role,
  }) async {
    final url = _makeUri(
      '/user/registration',
    );
    final parameters = <String, dynamic>{
      'email': email,
      'password': password,
      'role': role,
    };

    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final json = (await response.jsonDecode()) as Map<String, dynamic>;

    final token = json['token'] as String;
    return token;
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    final url = _makeUri(
      '/user/login',
    );
    final parameters = <String, dynamic>{
      'email': email,
      'password': password,
    };

    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final json = (await response.jsonDecode()) as Map<String, dynamic>;

    final token = json['token'] as String;
    return token;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}
