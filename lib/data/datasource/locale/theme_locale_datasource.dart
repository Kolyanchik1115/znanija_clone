import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:znanija_clone/core/enums/theme_type.dart';
import 'package:znanija_clone/core/resources/app_themes.dart';

class ThemeLocalData {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> saveThemeToSecureStorage({
    required AppTheme theme,
  }) async {
    final themeString = AppThemes.themeToString[theme];
    await _secureStorage.write(key: 'theme', value: themeString);
  }

  Future<AppTheme?> getThemeFromSecureStorage() async {
    final themeString = await _secureStorage.read(key: 'theme');
    final theme = AppThemes.stringToTheme[themeString];
    return theme;
  }
}
