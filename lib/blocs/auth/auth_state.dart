part of 'auth_bloc.dart';

enum AuthStatus { check, authorized, unauthorized, error, inProgress }

class AuthState extends Equatable {
  final UserInfoModel user;
  final AuthStatus status;

  const AuthState({
    this.status = AuthStatus.check,
    this.user = const UserInfoModel(
      email: '',
    ),
  });

  AuthState copyWith({
    UserInfoModel? user,
    AuthStatus? status,
  }) {
    return AuthState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [user, status];
}
