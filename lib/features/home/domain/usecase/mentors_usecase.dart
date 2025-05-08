import 'package:osnv/features/home/domain/entity/mentors_entity.dart';
import 'package:osnv/features/home/domain/repsitory/home_repository.dart';

class MentorsUsecase{
  HomeRepository homeRepository;
  MentorsUsecase(this.homeRepository);

  Future<MentorsResponce> call(){
    return homeRepository.mentors();
  }

}