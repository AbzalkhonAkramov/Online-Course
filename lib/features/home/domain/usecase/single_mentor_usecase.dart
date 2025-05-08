import 'package:osnv/features/home/domain/entity/single_mentor_entiry.dart';
import 'package:osnv/features/home/domain/repsitory/home_repository.dart';

class SingleMentorUsecase{
  HomeRepository homeRepository;

  SingleMentorUsecase(this.homeRepository);

  Future<SingleMentorEntity> call({required int id}){
   return homeRepository.singleMentors(id: id);
  }
}