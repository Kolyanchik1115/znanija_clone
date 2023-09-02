import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:znanija_clone/data/datasource/remote/auth_remote_datasource.dart';
import 'package:znanija_clone/data/models/user_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _apiClient = AuthClient();

  ProfileBloc() : super(const ProfileState()) {
    on<GetUserProfileData>((event, emit) async {
      try {
        final userData = await _apiClient.getMyProfileData();
        emit(state.copyWith(userData: userData));
      } catch (_) {}
    });
  }
}
