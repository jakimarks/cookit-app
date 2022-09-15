import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final ValueSetter<int> onTap;
  final int currentIndex;

  const Menu({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Recipes"),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "Find"),
      ],
      onTap: onTap,
      currentIndex: currentIndex,
    );
  }
}
