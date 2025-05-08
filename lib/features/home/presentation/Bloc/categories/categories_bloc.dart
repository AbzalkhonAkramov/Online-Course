import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:osnv/features/home/domain/entity/category.dart';
import 'package:osnv/features/home/domain/usecase/categories_usecase.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesUsecase categoriesUsecase;
  CategoriesBloc(this.categoriesUsecase) : super(CategoriesInitial()) {
    on<CategoriesEvent>((event, emit) async {
      emit(CategoriesLoading());
      try{
        final response = await categoriesUsecase();
        emit(CategoriesLoaded(categories: response));
      }
      catch(e){
        emit(CategoriesError(message: e.toString()));
      }
    });
  }
}
