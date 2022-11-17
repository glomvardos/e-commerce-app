part of 'auth_service.dart';

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException({this.message = 'An error occurred. '});
}