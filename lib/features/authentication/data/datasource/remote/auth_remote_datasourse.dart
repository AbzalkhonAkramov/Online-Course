import 'package:dio/dio.dart';
import 'package:osnv/features/authentication/data/model/auth_token.dart';
import 'package:osnv/features/authentication/data/model/user_get_model.dart';

abstract class AuthRemoteDatasourse {
  Future<UserGetModel> registerwithEmail({required password, required email});

  Future<AuthTokenModel> verifyCode({required code, required userId});
}

class AuthRemoteDatasourseImpl extends AuthRemoteDatasourse {
  final Dio dio;

  AuthRemoteDatasourseImpl({required this.dio});

  @override
  Future<UserGetModel> registerwithEmail({
    required password,
    required email,
  }) async {
    final response = await dio.post(
      "https://manuchehra.pythonanywhere.com/api/auth/register/",
      data: {'phone_or_email': email, 'password': password},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return UserGetModel.fromJson(response.data);
    } else {
      throw Exception('Failed to auth');
    }
  }

  @override
  Future<AuthTokenModel> verifyCode({required code, required userId}) async {
    final response = await dio.post(
      "https://manuchehra.pythonanywhere.com/api/auth/confirm-email/",
      data: {"user_id": userId, "code": code},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return AuthTokenModel.fromJson(response.data);
    } else {
      throw Exception("FAILED verify code");
    }
  }
}
