import 'package:e_commerce_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:e_commerce_app/presentation/screens/admin/admin_home_screen/admin_home_screen.dart';
import 'package:e_commerce_app/presentation/screens/customer/customer_home_screen/customer_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './presentation/screens/admin/widgets/add_entries_tab_bar.dart';
import './presentation/theme/theme.dart';
import './presentation/screens/auth/login_screen.dart';
import './presentation/screens/auth/register_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: themeData,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (_, state) {
            if (state is AuthenticationSuccessCustomer) {
              return const CustomerHomeScreen();
            }
            if (state is AuthenticationSuccessAdmin) {
              return const AdminHomeScreen();
            }
            return const LoginScreen();
          },
        ),
        routes: {
          // ----- Auth Routes -----
          LoginScreen.routeName: (_) => const LoginScreen(),
          RegisterScreen.routeName: (_) => const RegisterScreen(),
          // ----- Admin Routes -----
          AddEntriesTabBar.routeName: (_) => const AddEntriesTabBar(),

          // ----- Customer Routes -----
        });
  }
}
