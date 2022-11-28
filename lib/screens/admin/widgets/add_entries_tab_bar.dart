import 'package:e_commerce_app/screens/admin/add_product_screen/add_product_screen.dart';
import 'package:flutter/material.dart';

class AddEntriesTabBar extends StatelessWidget {
  const AddEntriesTabBar({
    Key? key,
  }) : super(key: key);

  static const routeName = '/add-entries';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 35,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Products'),
              Tab(text: 'Categories'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AddProductScreen(),
            Text('Offer'),
          ],
        ),
      ),
    );
  }
}
