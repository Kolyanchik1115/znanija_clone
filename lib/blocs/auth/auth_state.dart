part of 'auth_bloc.dart';

enum AuthStatus { initial, error, success }

class AuthState extends Equatable {
  final UserInfoModel user;
  final AuthStatus status;

  const AuthState({
    this.status = AuthStatus.initial,
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
