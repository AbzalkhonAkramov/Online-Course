class UserPost {
  String phoneOrEmail;
  String password;

  UserPost({
    required this.phoneOrEmail,
    required this.password,
  });

  factory UserPost.fromJson(Map<String, dynamic> json) => UserPost(
    phoneOrEmail: json["phone_or_email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "phone_or_email": phoneOrEmail,
    "password": password,
  };
}
