import 'package:osnv/features/authentication/domain/entity/auth_token.dart';
import 'package:osnv/features/authentication/domain/entity/user_entity.dart';

abstract class AuthRepository{

  Future<GetUser> registerwithEmail({required password , required email});

  //verify code
  Future<AuthToken> verifyCode({required code ,required userId});
}