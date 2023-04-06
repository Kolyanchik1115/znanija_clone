import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/common/theme/borders.dart';
import 'package:znanija_clone/datasource/locale/auth_locale_datasource.dart';
import 'package:znanija_clone/datasource/locale/theme_locale_datasource.dart';
import 'package:znanija_clone/datasource/remote/remote_datasource.dart';
import 'package:znanija_clone/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _apiClient = ApiClient();

  AuthBloc() : super(const AuthState()) {
    on<AuthLoginEvent>((event, emit) async {
      final user = await _apiClient.signIn(
        email: event.email,
        password: event.password,
      );
      await AuthenticateLocalData().saveUserToSecureStorage(userModel: user);
      emit(state.copyWith(user: user));
    });

    on<AuthRegistrationEvent>((event, emit) async {
      final user = await _apiClient.signUp(
        email: event.email,
        password: event.password,
        role: event.role,
      );
      await AuthenticateLocalData().saveUserToSecureStorage(userModel: user);
      emit(state.copyWith(user: user));
    });
    on<AuthCheckUserExist>((event, emit) async {
      final user = await AuthenticateLocalData().getUserFromSecureStorage();

      if (user != null) {
        emit(state.copyWith(
            status: AuthStatus.gotUser, user: user));
      } else {
        emit(state.copyWith(status: AuthStatus.noUser));
      }
    });

    on<AuthLogoutEvent>((event, emit) async {
      await AuthenticateLocalData().clearStorage();
    });
  }
}
