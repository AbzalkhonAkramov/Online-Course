part of 'auth_bloc.dart';

class AuthEvent {
  final String password;
  final String email;

  AuthEvent({required this.password, required this.email});
}
