import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:znanija_clone/common/config.dart';
import 'package:znanija_clone/models/user_model.dart';

class AuthClient {
  final _dio = Dio();
  final _host = Config.host;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<UserInfoModel> fetchUserModelFromGoogle() async {
    final googleSignInAccount = await _googleSignIn.signIn();
    final googleAuth = await googleSignInAccount?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final user = await FirebaseAuth.instance.signInWithCredential(credential);
    final token = await user.user?.getIdToken();
    print(token);
    final email = user.user?.email ?? '';
    final userInfo = UserInfoModel(email: email);
    return userInfo;
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
