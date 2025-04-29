part of 'verify_bloc.dart';

@immutable
sealed class VerifyState {}

final class VerifyInitial extends VerifyState {}
final class VerifyLoading extends VerifyState {}
final class VerifyLoaded extends VerifyState {
  final AuthToken authToken;

  VerifyLoaded({required this.authToken});
}
final class VerifyError extends VerifyState {
  final String message;

  VerifyError({required this.message});

}

