part of 'mentors_bloc.dart';

@immutable
sealed class MentorsState {}

final class MentorsInitial extends MentorsState {}

final class MentorsLoading extends MentorsState {}

final class MentorsLoaded extends MentorsState {
  final MentorsResponce response;

  MentorsLoaded({required this.response});
}

final class MentorsError extends MentorsState {
  final String message;

  MentorsError({required this.message});
}
