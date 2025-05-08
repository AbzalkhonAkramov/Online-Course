import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:osnv/features/authentication/domain/entity/user_entity.dart';
import 'package:osnv/features/authentication/domain/usecase/auth_email_with_password_usecase.dart';

part '../auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRegisterWithEmailUsecase registerWithEmail;

  AuthBloc(this.registerWithEmail) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await registerWithEmail(
          email: event.email,
          password: event.password,
        );
        emit(AuthSuccess(getUser: user));
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
  }
}
