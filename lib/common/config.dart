class Config {
  static const String host = 'http://192.168.0.101:6001/api';
  static String imageUrl(String path) => 'http://192.168.0.101:6001/$path.png';
}
  // Config() {
  //   if (Platform.isAndroid) {
  //     host = ;
  //   } else if (Platform.isIOS) {
  //     host = 'http://127.0.0.1:8002/api';
  //   }
  // }
  // String get point => host;

