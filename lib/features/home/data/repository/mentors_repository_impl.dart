import 'package:osnv/features/home/data/datasourse/mentors_datasource_remote.dart';
import 'package:osnv/features/home/data/model/category_model.dart';
import 'package:osnv/features/home/data/model/mentors_model.dart';
import 'package:osnv/features/home/domain/entity/courses.dart';
import 'package:osnv/features/home/domain/entity/mentors_entity.dart';
import 'package:osnv/features/home/domain/entity/single_mentor_entiry.dart';
import 'package:osnv/features/home/domain/repsitory/home_repository.dart';

class MentorsRepositoryImpl implements HomeRepository {
  final MentorsDatasource mentorsDatasource;

  MentorsRepositoryImpl(this.mentorsDatasource);

  @override
  Future<MentorsResponceModel> mentors() {
    return mentorsDatasource.mentors();
  }

  @override
  Future<SingleMentorEntity> singleMentors({required int id}) {
    return mentorsDatasource.singleMentors(id: id);
  }

  @override
  Future<CategoryModel> category() {
    return mentorsDatasource.category();
  }

  @override
  Future<Courses> courses() {
    return mentorsDatasource.courses();
  }

  @override
  Future<CoursesResult> courseByDetails({required int id}) {
    return mentorsDatasource.courseByDetails(id: id);
  }

  @override
  Future<Courses> searchCourses() {
    // TODO: implement searchCourses
    throw UnimplementedError();
  }

  @override
  Future<MentorsResponce> searchMentor() {
    // TODO: implement searchMentor
    throw UnimplementedError();
  }
}
