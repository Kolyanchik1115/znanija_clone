import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/common/theme/borders.dart';
import 'package:znanija_clone/datasource/locale/theme_locale_datasource.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<ChangeThemeEvent>((event, emit) async {
      emit(state.copyWith(theme: event.theme));
      await ThemeLocalData().saveThemeToSecureStorage(theme: event.theme);
    });

    on<ThemeCheckExist>((event, emit) async {
      final savedTheme = await ThemeLocalData().getThemeFromSecureStorage();
      emit(state.copyWith(theme: savedTheme));
    });
  }
}
