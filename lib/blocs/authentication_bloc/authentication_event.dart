part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class InitializeAuthentication extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class LoginUser extends AuthenticationEvent {
  final String username;
  final String password;

  const LoginUser({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}

class RegisterUser extends AuthenticationEvent {
  final String username;
  final String firstname;
  final String lastname;
  final String email;
  final String password;

  const RegisterUser({
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        username,
        firstname,
        lastname,
        email,
        password,
      ];
}
