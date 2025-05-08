import 'package:osnv/features/authentication/domain/entity/verify_code.dart';

class VerifyCodeModel extends VerifyCode {
  VerifyCodeModel({required super.userId, required super.code});

  factory VerifyCodeModel.fromJson(Map<String, dynamic> json) => VerifyCodeModel(
    userId: json["user_id"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "code": code,
  };
}
