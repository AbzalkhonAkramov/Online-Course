import 'package:osnv/features/authentication/data/datasource/auth_remote_datasourse.dart';
import 'package:osnv/features/authentication/data/model/user_get_model.dart';
import 'package:osnv/features/authentication/domain/repo/repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasourse remoteDatasourse;
  AuthRepositoryImpl(this.remoteDatasourse);

  @override
  Future<UserGetModel> registerwithEmail({required password, required email}) async {
    return remoteDatasourse.registerwithEmail(password: password, email: email);
  }



}