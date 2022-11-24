import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/services/auth_service/auth_service.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService authService;

  AuthenticationBloc({required this.authService})
      : super(AuthenticationInitial()) {
    on<InitializeAuthentication>((event, emit) {
      emit(AuthenticationLoading());
    });
  }
}
