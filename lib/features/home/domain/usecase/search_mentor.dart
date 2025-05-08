import 'package:osnv/features/home/domain/entity/mentors_entity.dart';
import 'package:osnv/features/home/domain/repsitory/home_repository.dart';

class SearchMentor{
  final HomeRepository homeRepository;

  SearchMentor({required this.homeRepository});

  Future<MentorsResponce> call(){
    return homeRepository.searchMentor();
  }
}