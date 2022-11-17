import 'package:e_commerce_app/bloc/authentication/authentication_bloc.dart';
import 'package:e_commerce_app/services/authService/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './app.dart';

void main() {
  runApp(
      MultiRepositoryProvider(
       providers: [
         RepositoryProvider<AuthService>(create: (context) => AuthServiceApi()),
       ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>(
              create: (context) =>AuthenticationBloc(authService: AuthServiceApi())..add(InitializeAuthentication()),
            )
          ],
          child: const MyApp(),
        ),
    )

  );
}

