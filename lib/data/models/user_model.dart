

class UserInfoModel {
  final int id;
  final String nickname;
  final String email;
  final String balance;
  final dynamic avatar;
  final int score;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic provider;
  final dynamic nicknameUpdatedAt;
  final bool isActivated;

  UserInfoModel({
    required this.id,
    required this.nickname,
    required this.email,
    required this.balance,
    required this.avatar,
    required this.score,
    required this.createdAt,
    required this.updatedAt,
    required this.provider,
    required this.nicknameUpdatedAt,
    required this.isActivated,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'],
      nickname: json['nickname'],
      email: json['email'],
      balance: json['balance'],
      avatar: json['avatar'],
      score: json['score'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      provider: json['provider'],
      nicknameUpdatedAt: json['nicknameUpdatedAt'],
      isActivated: json['isActivated'],
    );
  }
}

