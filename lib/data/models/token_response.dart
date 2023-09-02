class TokenResponse {
  final String jwt;

  TokenResponse({
    required this.jwt,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      jwt: json['token'],
    );
  }
}
