import 'package:osnv/features/home/domain/entity/single_mentor_entiry.dart';

class SingleMentorModel extends SingleMentorEntity {
  SingleMentorModel({
    required super.id,
    required super.user,
    required super.fullName,
    required super.email,
    required super.avatar,
    required super.avatarUrl,
    required super.bio,
    required super.expertise,
    required super.rating,
    required super.isTopMentor,
    required super.createdAt,
  });

  factory SingleMentorModel.fromJson(Map<String, dynamic> json) =>
      SingleMentorModel(
        id: json["id"],
        user: json["user"],
        fullName: json["full_name"],
        email: json["email"],
        avatar: json["avatar"],
        avatarUrl: json["avatar_url"],
        bio: json["bio"],
        expertise: json["expertise"],
        rating: json["rating"],
        isTopMentor: json["is_top_mentor"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user,
    "full_name": fullName,
    "email": email,
    "avatar": avatar,
    "avatar_url": avatarUrl,
    "bio": bio,
    "expertise": expertise,
    "rating": rating,
    "is_top_mentor": isTopMentor,
    "created_at": createdAt.toIso8601String(),
  };
}
