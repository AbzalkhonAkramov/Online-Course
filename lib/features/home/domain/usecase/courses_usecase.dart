import 'package:osnv/features/home/domain/entity/courses.dart';
import 'package:osnv/features/home/domain/repsitory/home_repository.dart';

class CoursesUsecase {
  final HomeRepository homeRepository;

  CoursesUsecase({required this.homeRepository});

  Future<Courses> call() {
    return homeRepository.courses();
  }
}
