// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthData {
  final String token_type;
  final String access_token;
  final DateTime expires_at;
  AuthData({
    required this.token_type,
    required this.access_token,
    required this.expires_at,
  });

  AuthData copyWith({
    String? token_type,
    String? access_token,
    DateTime? expires_at,
  }) {
    return AuthData(
      token_type: token_type ?? this.token_type,
      access_token: access_token ?? this.access_token,
      expires_at: expires_at ?? this.expires_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token_type': token_type,
      'access_token': access_token,
      'expires_at': expires_at.millisecondsSinceEpoch,
    };
  }

  factory AuthData.fromMap(Map<String, dynamic> map) {
    return AuthData(
      token_type: map['token_type'],
      access_token: map['access_token'],
      expires_at:
          DateTime.fromMillisecondsSinceEpoch(map['expires_at'] * 1000 as int)
              .toLocal(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthData.fromJson(String source) =>
      AuthData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AuthData(token_type: $token_type, access_token: $access_token, expires_at: $expires_at)';

  @override
  bool operator ==(covariant AuthData other) {
    if (identical(this, other)) return true;

    return other.token_type == token_type &&
        other.access_token == access_token &&
        other.expires_at == expires_at;
  }

  @override
  int get hashCode =>
      token_type.hashCode ^ access_token.hashCode ^ expires_at.hashCode;
}
