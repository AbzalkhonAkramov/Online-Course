import '../entity/category.dart';
import '../repsitory/home_repository.dart';

class CategoriesUsecase{
  HomeRepository homeRepository;
  CategoriesUsecase(this.homeRepository);

  Future<Categories> call(){
    return homeRepository.category();
  }

}