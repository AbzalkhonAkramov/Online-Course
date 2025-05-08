part of 'courses_bloc.dart';

@immutable
sealed class CoursesState {}

final class CoursesInitial extends CoursesState {}

final class CoursesLoading extends CoursesState {}

final class CoursesLoaded extends CoursesState {
  final Courses courses;

  CoursesLoaded({required this.courses});
}

final class CoursesError extends CoursesState {
  final String message;

  CoursesError({required this.message});
}
