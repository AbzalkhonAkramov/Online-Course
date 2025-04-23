import 'package:osnv/features/authentication/domain/entity/user_entity.dart';

class UserGetModel extends GetUser {
  UserGetModel({required super.userId,});

  factory UserGetModel.fromJson(Map<String, dynamic> json) =>
      UserGetModel(userId: json["user_id"]);
  Map<String, dynamic> toJson() => {"user_id": userId, };
}
