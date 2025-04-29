part of 'verify_bloc.dart';

@immutable
class VerifyEvent {
  final int code;
  final int user_id;

  VerifyEvent({required this.user_id, required this.code});
}
