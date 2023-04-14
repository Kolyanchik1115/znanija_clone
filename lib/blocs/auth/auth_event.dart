part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthLogoutEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class AuthRegistrationEvent extends AuthEvent {
  final String email;
  final String password;

  AuthRegistrationEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [email, password];
}

class AuthCheckUserExist extends AuthEvent {}
