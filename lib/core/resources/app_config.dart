class Config {
  static const String addres = 'http://192.168.0.100:6002';
  static const String host = '$addres/api';
  static String imageUrl(String path) => '$addres/$path.png';
}
  // Config() {
  // static const String host = 'http://192.168.0.102:6001/api';
  //   if (Platform.isAndroid) {
  //     host = 'http://127.0.0.1:8002/api' ;
  //   } else if (Platform.isIOS) {
  //     host = 'http://127.0.0.1:8002/api';
  //   }
  // }
  // String get point => host;

