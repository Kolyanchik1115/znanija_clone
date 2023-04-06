part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final AppTheme theme;

  const SettingsState({
    this.theme = AppTheme.lightTheme,
  });

  SettingsState copyWith({
    AppTheme? theme,
  }) {
    return SettingsState(
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object?> get props => [theme];
}
