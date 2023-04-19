import 'dart:io';

class Config {
  late final String host;

  Config() {
    if (Platform.isAndroid) {
      host = 'http://10.0.2.2:8002/api';
    } else if (Platform.isIOS) {
      host = 'http://127.0.0.1:8002/api';
    }
  }

  String get point => host;
}