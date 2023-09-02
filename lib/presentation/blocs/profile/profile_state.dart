part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final UserInfoModel? userData;

  const ProfileState({this.userData});

  ProfileState copyWith({
    UserInfoModel? userData,
  }) {
    return ProfileState(
      userData: userData ?? this.userData,
    );
  }

  @override
  List<Object?> get props => [userData];
}
