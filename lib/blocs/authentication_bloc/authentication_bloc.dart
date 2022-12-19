import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/auth_repository.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;

  AuthenticationBloc({required this.authRepository})
      : super(AuthenticationInitial()) {
    on<InitializeAuthentication>((event, emit) {});

    on<LoginUser>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        final token = await authRepository.login(
            username: event.username, password: event.password);
        emit(token != null ? AuthenticationSuccess() : UnAuthenticated());
      } on DioError catch (error) {
        emit(AuthenticationFailure(error: error));
      }
    });

    on<RegisterUser>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        await authRepository.register(
          username: event.username,
          firstname: event.firstname,
          lastname: event.lastname,
          email: event.email,
          password: event.password,
        );
        emit(RegisterSuccess());
      } on DioError catch (error) {
        emit(
          RegisterFailure(error: error),
        );
      }
    });
  }
}
