import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:znanija_clone/common/config.dart';
import 'package:znanija_clone/models/google_adapter.dart';
import 'package:znanija_clone/models/user_model.dart';

class ApiClient {
  final _dio = Dio();
  final _host = Config.host;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<UserInfoModel> fetchUserModelFromGoogle() async {
    final googleAdapter = GoogleUserAdapter();
    final account = await _googleSignIn.signIn();
    return googleAdapter.adaptData(account);
  }

  Future<UserInfoModel> signUp({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '$_host/user/registration',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final json = await response.data;
      final token = json['token'] as String;
      final decodedToken = JwtDecoder.decode(token);

      final user = UserInfoModel.fromJson(decodedToken);
      return user;
    } else {
      throw Exception('failed to load user $email');
    }
  }

  Future<UserInfoModel> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '$_host/user/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final json = await response.data;
      final token = json['token'] as String;
      final decodedToken = JwtDecoder.decode(token);

      final user = UserInfoModel.fromJson(decodedToken);

      return user;
    } else {
      throw Exception('failed to load user $email');
    }
  }
}
