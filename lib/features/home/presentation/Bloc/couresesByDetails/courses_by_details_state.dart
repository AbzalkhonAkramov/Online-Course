part of 'courses_by_details_bloc.dart';

@immutable
sealed class CoursesByDetailsState {}

final class CoursesByDetailsInitial extends CoursesByDetailsState {}

final class CoursesByDetailsLoading extends CoursesByDetailsState {}

final class CoursesByDetailsLoaded extends CoursesByDetailsState {
  final CoursesResult coursesResult;

  CoursesByDetailsLoaded({required this.coursesResult});
}

final class CoursesByDetailsError extends CoursesByDetailsState {
  final String message;

  CoursesByDetailsError({required this.message});
}
