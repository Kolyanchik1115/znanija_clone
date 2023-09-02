import 'dart:io';

import 'package:dio/dio.dart';
import 'package:znanija_clone/core/resources/app_config.dart';
import 'package:znanija_clone/data/datasource/locale/auth_locale_datasource.dart';
import 'package:znanija_clone/data/models/token_response.dart';
import 'package:znanija_clone/data/models/user_model.dart';

class AuthClient {
  final _dio = Dio();
  final _host = Config.host;

  // static final _googleSignIn = GoogleSignIn();
  final _authLocalData = AuthenticateLocalData();
  // static void fetchUserModelFromGoogle() async {
  //   final googleSignInAccount = await _googleSignIn.signIn();
  //   final googleAuth = await googleSignInAccount?.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //
  //   final user = await FirebaseAuth.instance.signInWithCredential(credential);
  //   // final token = await user.user?.getIdToken();
  //   // print(token);
  //   final email = user.user?.email ?? '';
  //   final userInfo = UserInfoModel(email: email);
  //   return userInfo;
  // }

  Future<TokenResponse> signUp({
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
      final responseData = response.data;
      final tokenResponse = TokenResponse.fromJson(responseData);
      _authLocalData.saveToken(tokenResponse.jwt);
      return tokenResponse;
    } else {
      throw Exception('Failed to load user $email');
    }
  }

  Future<TokenResponse> signIn({
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
      final responseData = response.data;
      final tokenResponse = TokenResponse.fromJson(responseData);
      _authLocalData.saveToken(tokenResponse.jwt);
      return tokenResponse;
    } else {
      throw Exception('failed to load user $email');
    }
  }

  Future<UserInfoModel> getMyProfileData() async {
    final token = await AuthenticateLocalData().getToken();
    final response = await _dio.get(
      '$_host/user/profile',
      options: Options(
        contentType: Headers.jsonContentType,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      final responseData = response.data;
      return UserInfoModel.fromJson(responseData);
    } else {
      throw Exception('Failed to load user');
    }
  }

// Future<UserInfoModel> userTokenDecoder(Response<dynamic> response) async {
//   final json = await response.data;
//   print(json);
//   final token = json['token'] as String;
//   print(token);
//   final decodedToken = JwtDecoder.decode(token);
//   print(decodedToken);
//
//   final user = UserInfoModel.fromJson(decodedToken);
//   print(user);
//
//   final encodedToken = jsonEncode(decodedToken);
//   _authLocalData.saveToken(token);
//   return user;
// }
}
