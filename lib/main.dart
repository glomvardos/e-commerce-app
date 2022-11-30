import 'package:e_commerce_app/data/client/dio_client.dart';
import 'package:e_commerce_app/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './blocs/authentication_bloc/authentication_bloc.dart';
import './data/repositories/products_repository.dart';
import './data/repositories/categories_repository.dart';
import './app.dart';

void main() {
  final dioClient = DioClient();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider<AuthRepository>(
        create: (_) => AuthRepository(dio: dioClient.client),
      ),
      RepositoryProvider<ProductsRepository>(
        create: (_) => ProductsRepository(
          dio: dioClient.client,
        ),
      ),
      RepositoryProvider<CategoriesRepository>(
        create: (_) => CategoriesRepository(
          dio: dioClient.client,
        ),
      ),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) =>
              AuthenticationBloc(authRepository: context.read<AuthRepository>())
                ..add(InitializeAuthentication()),
        )
      ],
      child: const MyApp(),
    ),
  ));
}
