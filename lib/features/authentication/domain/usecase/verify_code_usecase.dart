import 'package:osnv/features/authentication/domain/entity/auth_token.dart';
import 'package:osnv/features/authentication/domain/repo/repo.dart';

class VerifyCodeUsecase{
  final AuthRepository repository;

  VerifyCodeUsecase({required this.repository});

  Future<AuthToken> call({required int code,required int user_id}) {
    return repository.verifyCode(code: code, user_id: user_id);
  }
}