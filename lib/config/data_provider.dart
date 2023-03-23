import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const token = 'token';
}

class TokenDataProvider {
  final _secureStorage = const FlutterSecureStorage();

  Future<String?> getToken() => _secureStorage.read(key: _Keys.token);

  Future<void> setToken(String value) {
    return _secureStorage.write(key: _Keys.token, value: value);
  }

  Future<void> deleteToken() {
    return _secureStorage.delete(key: _Keys.token);
  }
}
