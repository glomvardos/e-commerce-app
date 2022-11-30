import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/auth_repository.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;

  AuthenticationBloc({required this.authRepository})
      : super(AuthenticationInitial()) {
    on<InitializeAuthentication>((event, emit) {
      emit(AuthenticationLoading());
    });
  }
}
