import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:osnv/features/home/domain/usecase/mentors_usecase.dart';
import '../../../domain/entity/mentors_entity.dart';

part 'mentors_event.dart';
part 'mentors_state.dart';

class MentorsBloc extends Bloc<MentorsEvent, MentorsState> {
  final MentorsUsecase mentorsUsecase;

  MentorsBloc(this.mentorsUsecase) : super(MentorsInitial()) {
    on<MentorsEvent>((event, emit) async {
      emit(MentorsLoading());
      try{
        final response = await mentorsUsecase();
        emit(MentorsLoaded(response: response));
      }catch(e){
        emit(MentorsError(message: e.toString()));
      }
    });
  }
}
