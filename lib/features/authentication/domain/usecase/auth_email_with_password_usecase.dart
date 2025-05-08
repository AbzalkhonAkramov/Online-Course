import 'package:osnv/features/authentication/domain/entity/user_entity.dart';
import 'package:osnv/features/authentication/domain/repo/repo.dart';

class AuthRegisterWithEmailUsecase{
  final AuthRepository repository;
  AuthRegisterWithEmailUsecase({required this.repository});

  Future<GetUser> call({required String email, required String password}) {
    return repository.registerwithEmail(password: password, email: email);
  }
}

