import 'package:jwt_decoder/jwt_decoder.dart';

bool isAuth(String? token) {
  return token != null && JwtDecoder.isExpired(token) == false;
}
