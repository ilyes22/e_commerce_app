import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class BottomBar extends StatefulWidget {
  BottomBar({super.key, required this.tapBottom});
  void Function(int index) tapBottom;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.tapBottom(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return GNav(
      tabs: const [
        GButton(
          icon: Icons.home,
        ),
        GButton(icon: Icons.shopping_cart),
        GButton(
          icon: Icons.payment,
        ),
        GButton(icon: Icons.person),
      ],
      haptic: true,
      rippleColor: Colors.amber,

      // fixedColor: Colors.amber,
      activeColor: Colors.amber,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      duration: const Duration(milliseconds: 200),
      onTabChange: _onItemTapped,
      selectedIndex: _selectedIndex,
      gap: 5,
      color: const Color.fromARGB(80, 228, 228, 228),

      iconSize: 20,
    );
  }
}
