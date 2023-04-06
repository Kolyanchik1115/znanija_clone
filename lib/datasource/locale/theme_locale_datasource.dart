import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:znanija_clone/common/theme/borders.dart';

class ThemeLocalData {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> saveThemeToSecureStorage({
    required AppTheme theme,
  }) async {
    final themeString = themeToString[theme];
    await _secureStorage.write(key: 'theme', value: themeString);
  }

  Future<AppTheme?> getThemeFromSecureStorage() async {
    final themeString = await _secureStorage.read(key: 'theme');
    final theme = stringToTheme[themeString];
    return theme;
  }
}
