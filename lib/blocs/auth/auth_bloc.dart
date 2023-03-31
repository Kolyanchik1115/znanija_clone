import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/config/data_provider.dart';
import 'package:znanija_clone/domain/auth_api.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _tokenDataProvider = TokenDataProvider();
  final _apiClient = ApiClient();

  AuthBloc() : super(AuthState()) {
    on<AuthLoginEvent>((event, emit) async {
      final String logToken = await _apiClient.signIn(
        email: event.email,
        password: event.password,
      );
      await TokenDataProvider().setToken(logToken);
      emit(state.copyWith(token: logToken));
    });

    on<AuthRegistrationEvent>((event, emit) async {
      final String regToken = await _apiClient.signUp(
        email: event.login,
        password: event.password,
        role: event.role,
      );
      await TokenDataProvider().setToken(regToken);
      emit(state.copyWith(token: regToken));
    });

    on<AuthLogoutEvent>((event, emit) async {
      await _tokenDataProvider.deleteToken();
    });
  }
}
