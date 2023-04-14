import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/datasource/locale/auth_locale_datasource.dart';
import 'package:znanija_clone/datasource/remote/remote_datasource.dart';
import 'package:znanija_clone/models/google_adapter.dart';
import 'package:znanija_clone/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _apiClient = ApiClient();

  AuthBloc() : super(const AuthState()) {
    on<AuthLoginEvent>((event, emit) async {
      try {
        final user = await _apiClient.signIn(
          email: event.email,
          password: event.password,
        );
        await AuthenticateLocalData().saveUserToSecureStorage(userModel: user);
        emit(state.copyWith(user: user, status: AuthStatus.success));
      } catch (e) {
        emit(state.copyWith(status: AuthStatus.error));
      }
    });

    on<AuthGoogleLoginEvent>((event, emit) async {
      try {
        final getUserFromGoogle = await ApiClient.fetchUserModelFromGoogle();

        final userdata = await _apiClient.signIn(
          email: getUserFromGoogle.email,
          password: getUserFromGoogle.email,
        );
        await AuthenticateLocalData()
            .saveUserToSecureStorage(userModel: userdata);
        emit(state.copyWith(user: userdata, status: AuthStatus.success));
      } catch (e) {
        emit(state.copyWith(status: AuthStatus.error));
      }
    });

    on<AuthGoogleRegistrationEvent>((event, emit) async {
      try {
        final getUserFromGoogle = await ApiClient.fetchUserModelFromGoogle();

        final userdata = await _apiClient.signUp(
          email: getUserFromGoogle.email,
          password: getUserFromGoogle.email,
        );
        await AuthenticateLocalData()
            .saveUserToSecureStorage(userModel: userdata);
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
      await AuthenticateLocalData().saveUserToSecureStorage(userModel: user);
      emit(state.copyWith(user: user, status: AuthStatus.success));
    });
    on<AuthCheckUserExist>((event, emit) async {
      final user = await AuthenticateLocalData().getUserFromSecureStorage();

      if (user != null) {
        emit(state.copyWith(status: AuthStatus.success, user: user));
      } else {
        emit(state.copyWith(status: AuthStatus.error));
      }
    });

    on<AuthLogoutEvent>((event, emit) async {
      await AuthenticateLocalData().clearStorage();
    });
  }
}
