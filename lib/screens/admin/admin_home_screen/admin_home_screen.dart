import 'package:flutter/material.dart';

import './widgets/admin_bottom_nav_bar.dart';
import '../add_product_screen/add_product_screen.dart';
import '../products_screen/products_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = const [
    ProductsScreen(),
    Text('Offers'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home Screen'),
      ),
      body: Center(
        child: _screens[_selectedIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(AddProductScreen.routeName),
        child: const Icon(Icons.add_rounded),
      ),
      bottomNavigationBar: AdminBottomNavBar(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
    );
  }
}
