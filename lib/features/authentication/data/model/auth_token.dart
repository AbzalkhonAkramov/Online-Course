import 'package:osnv/features/authentication/domain/entity/auth_token.dart';

class AuthTokenModel extends AuthToken{

  AuthTokenModel({
    required super.refresh,
    required super.access,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) => AuthTokenModel(
    refresh: json["refresh"],
    access: json["access"],
  );

  Map<String, dynamic> toJson() => {
    "refresh": refresh,
    "access": access,
  };
}