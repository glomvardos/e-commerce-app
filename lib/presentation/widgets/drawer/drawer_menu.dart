import 'package:e_commerce_app/presentation/widgets/drawer/drawer_item.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          const DrawerHeader(
            child: Text('test'),
          ),
          Expanded(
            child: ListView(
              children: const [
                DrawerItem(
                  icon: Icons.logout,
                  text: 'Log out',
                  actionKey: 'logout',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
