import 'package:osnv/features/authentication/domain/entity/user_entity.dart';

abstract class AuthRepository{
  Future<GetUser> registerwithEmail({required password , required email});

}