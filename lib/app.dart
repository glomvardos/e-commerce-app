import 'package:flutter/material.dart';

import '../screens/admin/admin_home_screen/admin_home_screen.dart';
import '../screens/admin/add_product_screen/add_product_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF222831),
            secondary: const Color(0xFF00ADB5),
          ),
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              color: Color(0xFFEEEEEE),
            ),
          ),
          scaffoldBackgroundColor: const Color(0xFF393E46),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF222831),
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Color(0xFFEEEEEE),
            ),
            elevation: 0,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF222831),
            selectedItemColor: Color(0xFF00ADB5),
            unselectedItemColor: Color(0xFFEEEEEE),
            elevation: 0,
          ),
        ),
        home: const AdminHomeScreen(),
        routes: {
          // ----- Admin Routes -----
          AddProductScreen.routeName: (_) => const AddProductScreen(),

          // ----- Customer Routes -----
        });
  }
}
