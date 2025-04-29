import 'package:osnv/features/authentication/data/datasource/remote/auth_remote_datasourse.dart';
import 'package:osnv/features/authentication/data/model/auth_token.dart';
import 'package:osnv/features/authentication/data/model/user_get_model.dart';
import 'package:osnv/features/authentication/domain/repo/repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasourse remoteDatasourse;
  AuthRepositoryImpl(this.remoteDatasourse);

  @override
  Future<UserGetModel> registerwithEmail({required password, required email}) async {
    return remoteDatasourse.registerwithEmail(password: password, email: email);
  }

  @override
  Future<AuthTokenModel> verifyCode({required code, required user_id}) {
       return remoteDatasourse.verifyCode(code: code, user_id: user_id);
  }



}