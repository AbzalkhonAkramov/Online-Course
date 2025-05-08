part of 'single_mentors_bloc.dart';

@immutable
sealed class SingleMentorsState {}

final class SingleMentorsInitial extends SingleMentorsState {}

final class SingleMentorsLoading extends SingleMentorsState {}

final class SingleMentorsLoaded extends SingleMentorsState {
  final SingleMentorEntity response;

  SingleMentorsLoaded({required this.response});
}

final class SingleMentorsError extends SingleMentorsState {
  final String message;

  SingleMentorsError({required this.message});
}
