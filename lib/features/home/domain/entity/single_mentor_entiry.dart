class SingleMentorEntity {
  int id;
  int user;
  String fullName;
  String email;
  String avatar;
  String avatarUrl;
  String bio;
  String expertise;
  double rating;
  bool isTopMentor;
  DateTime createdAt;

  SingleMentorEntity({
    required this.id,
    required this.user,
    required this.fullName,
    required this.email,
    required this.avatar,
    required this.avatarUrl,
    required this.bio,
    required this.expertise,
    required this.rating,
    required this.isTopMentor,
    required this.createdAt,
  });
}
