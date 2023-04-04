import 'dart:developer';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:znanija_clone/config/config.dart';
import 'package:znanija_clone/models/user_model.dart';

class AuthenticateLocalData {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final host = Config.host;

  Future<void> saveUserToSecureStorage({
    required UserInfoModel userModel,
  }) async {
    final jsonUserModel = jsonEncode(userModel);
    await _secureStorage.write(key: 'user', value: jsonUserModel);
    log('Successful: User saved successfully');
  }

  Future<UserInfoModel?> getUserFromSecureStorage() async {
    final userModelFromStorage = await _secureStorage.read(key: 'user');
    final UserInfoModel userInfoModel = UserInfoModel.fromJson(
      jsonDecode(userModelFromStorage!),
    );
    log('Received all secure data');
    return userInfoModel;
  }

  Future<void> clearStorage() async {
    await _secureStorage.deleteAll();
    log('Secure storage has been cleared');
  }

  Future<bool> isUserLoggedIn() async {
    final user = await _secureStorage.read(key: 'user');
    return user != null;
  }

  bool isExpired({required String jwt}) {
    final jwtDecode = JwtDecoder.decode(jwt);
    final getExpire = jwtDecode['exp'];
    final dateTimeOneDayBefore =
        DateTime.fromMillisecondsSinceEpoch(getExpire * 1000).subtract(
      const Duration(days: 1),
    );
    final bool actualExpire = !DateTime.now().isAfter(dateTimeOneDayBefore);
    final formatter = DateFormat('dd.MM.yyyy');
    final formattedDate = formatter.format(dateTimeOneDayBefore);
    log('The expiration date of the token is equal to $formattedDate');
    return actualExpire;
  }
}
