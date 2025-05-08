import 'package:osnv/features/authentication/domain/entity/auth_token.dart';
import 'package:osnv/features/authentication/domain/repo/repo.dart';

class VerifyCodeUsecase{
  final AuthRepository repository;

  VerifyCodeUsecase({required this.repository});

  Future<AuthToken> call({required int code,required int userId}) {
    return repository.verifyCode(code: code, userId: userId);
  }
}