part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthLogoutEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({
    required this.email,
    required this.password,
  });
}

class AuthRegistrationEvent extends AuthEvent {
  final String login;
  final String password;
  final String role;

  AuthRegistrationEvent({
    required this.login,
    required this.password,
    required this.role,
  });
}
