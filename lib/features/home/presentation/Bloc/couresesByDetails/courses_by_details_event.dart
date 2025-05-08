part of 'courses_by_details_bloc.dart';
abstract class CoursesByDetailsEvent {
  const CoursesByDetailsEvent();

}

class FetchProduct extends CoursesByDetailsEvent{
  final int id;

  FetchProduct({required this.id});
}