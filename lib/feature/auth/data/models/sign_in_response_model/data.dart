import 'package:equatable/equatable.dart';

import 'user.dart';

class LoginData extends Equatable {
  final User? user;
  final String? token;
  final String? refreshToken;

  const LoginData({this.user, this.token, this.refreshToken});

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    user:
        json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] as String?,
    refreshToken: json['refreshToken'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'user': user?.toJson(),
    'token': token,
    'refreshToken': refreshToken,
  };

  @override
  List<Object?> get props => [user, token, refreshToken];
}
