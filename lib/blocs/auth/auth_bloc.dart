import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/datasource/locale/auth_locale_datasource.dart';
import 'package:znanija_clone/datasource/remote/remote_datasource.dart';
import 'package:znanija_clone/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _apiClient = ApiClient();

  AuthBloc() : super(const AuthState()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckUserExist) {
        await onAuthCheckUserExist(event, emit);
      } else if (event is AuthLoginEvent) {
        await onAuthLoginEvent(event, emit);
      } else if (event is AuthGoogleLoginEvent) {
        await onAuthGoogleLoginEvent(event, emit);
      } else if (event is AuthRegistrationEvent) {
        await onAuthRegistrationEvent(event, emit);
      } else if (event is AuthGoogleRegistrationEvent) {
        await onAuthGoogleRegistarationEvent(event, emit);
      } else if (event is AuthLogoutEvent) {
        await onAuthLogoutEvent(event, emit);
      }
    }, transformer: sequential());
    add(AuthCheckUserExist());
  }
  Future<void> onAuthLoginEvent(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.inProgress));
      final user = await _apiClient.signIn(
        email: event.email,
        password: event.password,
      );
      await AuthenticateLocalData().saveUserToSecureStorage(userModel: user);
      emit(state.copyWith(status: AuthStatus.authorized, user: user));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }

  Future<void> onAuthGoogleLoginEvent(
    AuthGoogleLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.inProgress));
      final getUserFromGoogle = await ApiClient.fetchUserModelFromGoogle();
      final userdata = await _apiClient.signIn(
        email: getUserFromGoogle.email,
        password: getUserFromGoogle.email,
      );
      await AuthenticateLocalData()
          .saveUserToSecureStorage(userModel: userdata);
      emit(state.copyWith(status: AuthStatus.authorized, user: userdata));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }

  Future<void> onAuthCheckUserExist(
    AuthCheckUserExist event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.inProgress));
    final user = await AuthenticateLocalData().getUserFromSecureStorage();

    final newState = user != null
        ? state.copyWith(status: AuthStatus.authorized)
        : state.copyWith(status: AuthStatus.unauthorized);
    emit(newState);
  }

  Future<void> onAuthLogoutEvent(
    AuthLogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await AuthenticateLocalData().clearStorage();
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }

  Future<void> onAuthGoogleRegistarationEvent(
    AuthGoogleRegistrationEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.inProgress));
      final getUserFromGoogle = await ApiClient.fetchUserModelFromGoogle();
      final userdata = await _apiClient.signUp(
        email: getUserFromGoogle.email,
        password: getUserFromGoogle.email,
      );
      await AuthenticateLocalData()
          .saveUserToSecureStorage(userModel: userdata);
      emit(state.copyWith(status: AuthStatus.authorized, user: userdata));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }

  Future<void> onAuthRegistrationEvent(
    AuthRegistrationEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.inProgress));
      final user = await _apiClient.signUp(
        email: event.email,
        password: event.password,
      );
      await AuthenticateLocalData().saveUserToSecureStorage(userModel: user);
      emit(state.copyWith(status: AuthStatus.authorized, user: user));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }
}
