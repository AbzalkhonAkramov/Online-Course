import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:osnv/features/authentication/domain/usecase/verify_code_usecase.dart';

import '../../../domain/entity/auth_token.dart';

part 'verify_event.dart';
part 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final VerifyCodeUsecase verifyCozdeUsecase;

  VerifyBloc( this.verifyCozdeUsecase) : super(VerifyInitial()) {
    on<VerifyEvent>((event, emit) async {
      emit(VerifyLoading());
      try{
        final token = await verifyCozdeUsecase(
          code: event.code,
          user_id: event.user_id
        );
        emit (VerifyLoaded(authToken: token));
      }
         catch(e){}

   });
  }
}
