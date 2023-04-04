import 'package:equatable/equatable.dart';

class UserInfoModel extends Equatable {
  final String email;
  final String role;

  const UserInfoModel({
    required this.email,
    required this.role,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      email: json['email'] as String,
      role: json['role'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'role': role,
    };
  }

  @override
  List<Object> get props => [email, role];
}
