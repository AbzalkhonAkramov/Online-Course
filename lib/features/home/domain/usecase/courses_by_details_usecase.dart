import 'package:osnv/features/home/domain/entity/courses.dart';
import 'package:osnv/features/home/domain/repsitory/home_repository.dart';

class CoursesByDetailsUsecase{
  final HomeRepository homeRepository;
  CoursesByDetailsUsecase({required this.homeRepository});

  Future<CoursesResult> call(int id){
    return homeRepository.courseByDetails(id: id);
  }
}