import 'package:flutter/material.dart';

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
        home: const LoginScreen(),
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
