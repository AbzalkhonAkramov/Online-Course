import 'package:osnv/features/authentication/domain/entity/verify_code.dart';

class VerifyCodeModel extends VerifyCode {
  VerifyCodeModel({required super.user_id, required super.code});

  factory VerifyCodeModel.fromJson(Map<String, dynamic> json) => VerifyCodeModel(
    user_id: json["user_id"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": user_id,
    "code": code,
  };
}
