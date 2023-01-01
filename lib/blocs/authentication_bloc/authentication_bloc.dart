import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/models/user.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;

  AuthenticationBloc({required this.authRepository})
      : super(AuthenticationInitial()) {
    on<InitializeAuthentication>((event, emit) async {
      emit(AuthenticationLoading());
      final SharedPreferences sharedPrefs =
          await SharedPreferences.getInstance();

      final token = sharedPrefs.getString('accessToken');
      final user = sharedPrefs.getString('user');

      if (token != null && user != null) {
        final authUser =
            User.fromJson(json.decode(sharedPrefs.getString('user')!));

        if (authUser.userRole == 'ADMIN') {
          emit(AuthenticationSuccessAdmin());
        }

        if (authUser.userRole == 'CUSTOMER') {
          emit(AuthenticationSuccessCustomer());
        }
      } else {
        emit(UnAuthenticated());
      }
    });

    on<LoginUser>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        final authUser = await authRepository.login(
          username: event.username,
          password: event.password,
        );
        if (authUser != null) {
          if (authUser.userRole == 'ADMIN') {
            emit(AuthenticationSuccessAdmin());
          }

          if (authUser.userRole == 'CUSTOMER') {
            emit(AuthenticationSuccessCustomer());
          }
        } else {
          emit(UnAuthenticated());
        }
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

    on<LogoutUser>((event, emit) async {
      emit(AuthenticationLoading());
      final SharedPreferences sharedPrefs =
          await SharedPreferences.getInstance();
      await sharedPrefs.remove('accessToken');
      await sharedPrefs.remove('user');
      emit(UnAuthenticated());
    });
  }
}
