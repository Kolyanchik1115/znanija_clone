import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:znanija_clone/data/datasource/locale/auth_locale_datasource.dart';
import 'package:znanija_clone/data/datasource/remote/auth_remote_datasource.dart';
import 'package:znanija_clone/data/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _apiClient = AuthClient();
  final _secureStorage = const FlutterSecureStorage();

  AuthBloc() : super(const AuthState()) {
    on<AuthLoginEvent>((event, emit) async {
      try {
        final user = await _apiClient.signIn(
          email: event.email,
          password: event.password,
        );
        emit(state.copyWith(user: user, status: AuthStatus.success));
      } catch (e) {
        emit(state.copyWith(status: AuthStatus.error));
      }
    });

    on<AuthGoogleLoginEvent>((event, emit) async {
      try {
        final getUserFromGoogle = await AuthClient.fetchUserModelFromGoogle();

        final userdata = await _apiClient.signIn(
          email: getUserFromGoogle.email,
          password: getUserFromGoogle.email,
        );
        emit(state.copyWith(user: userdata, status: AuthStatus.success));
      } catch (e) {
        emit(state.copyWith(status: AuthStatus.error));
      }
    });

    on<AuthGoogleRegistrationEvent>((event, emit) async {
      try {
        final getUserFromGoogle = await AuthClient.fetchUserModelFromGoogle();

        final userdata = await _apiClient.signUp(
          email: getUserFromGoogle.email,
          password: getUserFromGoogle.email,
        );
        emit(state.copyWith(user: userdata, status: AuthStatus.success));
      } catch (e) {
        emit(state.copyWith(status: AuthStatus.error));
      }
    });

    on<AuthRegistrationEvent>((event, emit) async {
      final user = await _apiClient.signUp(
        email: event.email,
        password: event.password,
      );
      emit(state.copyWith(user: user, status: AuthStatus.success));
    });
    on<AuthCheckUserExist>((event, emit) async {
      final userJson = await _secureStorage.read(key: 'user');
      if (userJson != null) {
        final user = UserInfoModel.fromJson(jsonDecode(userJson));
        emit(state.copyWith(status: AuthStatus.success, user: user));
      } else {
        emit(state.copyWith(status: AuthStatus.error));
      }
    });
    on<AuthLogoutEvent>((event, emit) async {
      await AuthenticateLocalData().clearStorage();
      emit(state.copyWith(status: AuthStatus.initial));
    });
  }
}
