part of 'settings_bloc.dart';

enum ThemeStatus { initial, changed }

class SettingsState extends Equatable {
  final ThemeStatus status;
  final AppTheme theme;
  const SettingsState({
    this.status = ThemeStatus.initial,
    this.theme = AppTheme.lightTheme,
  });

  @override
  List<Object> get props => [theme];

  SettingsState copyWith({
    ThemeStatus? status,
    AppTheme? theme,
  }) {
    return SettingsState(
      status: status ?? this.status,
      theme: theme ?? this.theme,
    );
  }
}
