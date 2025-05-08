import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:osnv/features/home/domain/entity/single_mentor_entiry.dart';
import 'package:osnv/features/home/domain/usecase/single_mentor_usecase.dart';

part 'single_mentors_event.dart';
part 'single_mentors_state.dart';

class SingleMentorsBloc extends Bloc<SingleMentorsEvent, SingleMentorsState> {
  final SingleMentorUsecase singleMentorUsecase;

  SingleMentorsBloc(this.singleMentorUsecase) : super(SingleMentorsInitial()) {
    on<SingleMentorsEvent>((event, emit) async {
      emit(SingleMentorsLoading());
      try {
        final response = await singleMentorUsecase(id: event.id);
        emit(SingleMentorsLoaded(response: response));
      }
      catch (e) {
        emit(SingleMentorsError(message: e.toString()));
      }
    });
  }
}
