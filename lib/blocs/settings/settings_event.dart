part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends SettingsEvent {
  final AppTheme theme;
  const ChangeThemeEvent({
    required this.theme,
  });
  @override
  List<Object> get props => [theme];
}

class ThemeCheckExist extends SettingsEvent {}
