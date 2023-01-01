import 'package:flutter/material.dart';

import '../products_screen/products_screen.dart';
import './widgets/admin_bottom_nav_bar.dart';
import '../widgets/add_entries_tab_bar.dart';
import '../../../widgets/drawer/drawer_menu.dart';

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
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text('Admin Home Screen'),
      ),
      body: Center(
        child: _screens[_selectedIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(AddEntriesTabBar.routeName),
        child: const Icon(Icons.add_rounded),
      ),
      bottomNavigationBar: AdminBottomNavBar(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
    );
  }
}
