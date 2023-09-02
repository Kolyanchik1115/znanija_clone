import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthenticateLocalData {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> clearStorage() async {
    await _googleSignIn.signOut();
    // await _firebaseAuth.signOut();
    await _secureStorage.deleteAll();
  }

  Future<String?> getToken() async {
    final token = await _secureStorage.read(key: 'user');
    log(token!);
    return await _secureStorage.read(key: 'user');
  }

  Future<void> saveToken(String data) async {
    await _secureStorage.write(key: 'user', value: data);
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
