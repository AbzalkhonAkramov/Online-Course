import 'package:dio/dio.dart';
import 'package:osnv/features/authentication/data/model/user_get_model.dart';

abstract class AuthRemoteDatasourse {
  Future<UserGetModel> registerwithEmail({required password, required email});
}

class AuthRemoteDatasourseImpl extends AuthRemoteDatasourse {
  final Dio dio;

  AuthRemoteDatasourseImpl({required this.dio});


  @override
  Future<UserGetModel> registerwithEmail(
      {required password, required email}) async {
    final response = await dio.post(
        "https://manuchehra.pythonanywhere.com/api/auth/register/",
        data: {
          'phone_or_email': email,
          'password': password,
        },
        options: Options(
            headers: {'Content-Type': 'application/json'}
        )
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return UserGetModel.fromJson(response.data);
    } else {
      throw Exception('Failed to auth');
    }
  }

}