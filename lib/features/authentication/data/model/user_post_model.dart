import 'package:osnv/features/authentication/domain/entity/user_post.dart';

class UserPostModel extends UserPost {
  UserPostModel({
    required super.phoneOrEmail, required super.password
  });

  factory UserPostModel.fromJson(Map<String, dynamic> json) =>
      UserPostModel(
        phoneOrEmail: json["phone_or_email"],
        password: json["password"],
      );

  @override
  Map<String, dynamic> toJson() =>
      {
        "phone_or_email": phoneOrEmail,
        "password": password,
      };
}

