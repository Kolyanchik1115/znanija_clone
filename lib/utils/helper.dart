import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:znanija_clone/config/data_provider.dart';

Future<bool> haveToken() async {
  final String? token = await TokenDataProvider().getToken();
  return token != null && JwtDecoder.isExpired(token) == false;
}

Future<String?> getToken() async {
  final String? token = await TokenDataProvider().getToken();
  return token;
}

Future<void> deleteToken() async {
  return await TokenDataProvider().deleteToken();
}
