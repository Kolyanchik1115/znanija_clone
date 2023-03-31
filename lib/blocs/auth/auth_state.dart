part of 'auth_bloc.dart';

class AuthState {
  final String token;

  AuthState({
    this.token = '',
  });

  AuthState copyWith({
    String? token,
  }) {
    return AuthState(
      token: token ?? this.token,
    );
  }
}
