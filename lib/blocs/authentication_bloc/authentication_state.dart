part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class UnAuthenticated extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationSuccess extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class RegisterSuccess extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class RegisterFailure extends AuthenticationState {
  final DioError error;

  const RegisterFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class AuthenticationFailure extends AuthenticationState {
  final DioError error;

  const AuthenticationFailure({required this.error});

  @override
  List<Object> get props => [error];
}
