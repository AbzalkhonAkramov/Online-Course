import 'package:osnv/features/home/domain/entity/category.dart';
import 'package:osnv/features/home/domain/entity/courses.dart';
import 'package:osnv/features/home/domain/entity/mentors_entity.dart';
import 'package:osnv/features/home/domain/entity/single_mentor_entiry.dart';

abstract class HomeRepository {
  Future<MentorsResponce> mentors();

  Future<SingleMentorEntity> singleMentors({required int id});

  Future<Categories> category();

  Future<Courses> courses();

  Future<CoursesResult> courseByDetails({required int id});

  Future<MentorsResponce> searchMentor();
  Future<Courses> searchCourses();
}
