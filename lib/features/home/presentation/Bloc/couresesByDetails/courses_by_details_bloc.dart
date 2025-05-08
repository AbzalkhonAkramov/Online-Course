import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:osnv/features/home/domain/entity/courses.dart';
import 'package:osnv/features/home/domain/usecase/courses_by_details_usecase.dart';

part 'courses_by_details_event.dart';
part 'courses_by_details_state.dart';

class CoursesByDetailsBloc extends Bloc<CoursesByDetailsEvent, CoursesByDetailsState> {
  final CoursesByDetailsUsecase coursesByDetailsUsecase;
  CoursesByDetailsBloc(this.coursesByDetailsUsecase) : super(CoursesByDetailsInitial()) {
    on<FetchProduct>((event, emit) async {
      emit(CoursesByDetailsLoading());
      try{
        final response = await coursesByDetailsUsecase(event.id);
        emit(CoursesByDetailsLoaded(coursesResult: response));
      }catch(e){
        emit(CoursesByDetailsError(message: e.toString()));
      }
    });
  }
}
