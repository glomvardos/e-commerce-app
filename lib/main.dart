import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication/authentication_bloc.dart';
import '../services/auth_service/auth_service.dart';
import '../services/products_service/products_service.dart';
import './app.dart';

void main() {
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<AuthService>(
        create: (_) => AuthApiService(),
      ),
      RepositoryProvider<ProductsService>(
        create: (_) => ProductsApiService(
          dio: AuthApiService().client,
        ),
      ),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc(authService: AuthApiService())
            ..add(InitializeAuthentication()),
        )
      ],
      child: const MyApp(),
    ),
  ));
}
