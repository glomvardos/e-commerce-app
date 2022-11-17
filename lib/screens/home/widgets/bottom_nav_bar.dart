import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);
  final int selectedIndex;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.percent),
          label: 'Offers',
        )
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }
}
