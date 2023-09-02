part of 'auth_bloc.dart';

enum AuthStatus { initial, error, success }

class AuthState extends Equatable {
  final TokenResponse? token;
  final AuthStatus status;

  const AuthState({
    this.status = AuthStatus.initial,
    this.token,
  });

  AuthState copyWith({
    TokenResponse? token,
    AuthStatus? status,
  }) {
    return AuthState(
      token: token ?? this.token,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [token, status];
}
