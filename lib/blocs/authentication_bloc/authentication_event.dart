part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class InitializeAuthentication extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
