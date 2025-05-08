import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:osnv/features/home/domain/entity/courses.dart';
import 'package:osnv/features/home/domain/usecase/courses_usecase.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final CoursesUsecase coursesUsecase;
  CoursesBloc(this.coursesUsecase) : super(CoursesInitial()) {
    on<CoursesEvent>((event, emit) async {
     emit(CoursesLoading());
     try{
       final courses = await coursesUsecase();
       emit(CoursesLoaded(courses: courses));
     }
     catch(e){
       emit(CoursesError( message: e.toString()));
     }
    });
  }
}
