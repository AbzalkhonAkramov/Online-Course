part of 'verify_bloc.dart';

@immutable
class VerifyEvent {
  final int code;
  final int userId;

  VerifyEvent({required this.userId, required this.code});
}
