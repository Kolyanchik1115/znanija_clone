import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/common/theme/borders.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<ChangeLightThemeEvent>((event, emit) {
      emit(state.copyWith(
        theme: AppTheme.lightTheme,
        status: ThemeStatus.changed,
      ));
    });
    on<ChangeDarkThemeEvent>((event, emit) {
      emit(state.copyWith(
        theme: AppTheme.darkTheme,
        status: ThemeStatus.changed,
      ));
    });
  }
}
