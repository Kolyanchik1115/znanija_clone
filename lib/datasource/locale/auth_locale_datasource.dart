import 'dart:developer';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:znanija_clone/models/user_model.dart';

class AuthenticateLocalData {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<UserInfoModel?> getUserFromSecureStorage() async {
    final userModelFromStorage = await _secureStorage.read(key: 'user');
    if (userModelFromStorage != null) {
      final UserInfoModel userInfoModel = UserInfoModel.fromJson(
        jsonDecode(userModelFromStorage),
      );
      return userInfoModel;
    }
    return null;
  }

  Future<void> saveUserToSecureStorage({
    required UserInfoModel userModel,
  }) async {
    final jsonUserModel = jsonEncode(userModel);
    await _secureStorage.write(key: 'user', value: jsonUserModel);
  }

  Future<void> clearStorage() async {
    final GoogleSignInAccount? googleUser =
        await _googleSignIn.signInSilently();
    if (googleUser != null) {
      await googleUser.authentication.then((value) async {
        await _googleSignIn.disconnect();
        if (_googleSignIn.currentUser != null) {
          await _googleSignIn.currentUser!.clearAuthCache();
        }
        await _secureStorage.deleteAll();
      });
    }
    await _secureStorage.delete(key: 'user');
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
