import 'package:flutter/material.dart';
import 'package:my_app/menu.dart';
import 'package:my_app/recipes/recipe_list_screen.dart';
import 'package:my_app/route/routes.dart';
import 'package:my_app/scan/scan.dart';

String qrResultInitialValue = "Not yet scanned";

ButtonStyle flatButtonStyle = TextButton.styleFrom(
  shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.green, width: 3.0),
      borderRadius: BorderRadius.circular(20.0)),
  padding: const EdgeInsets.all(15.0),
);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedMenuItem = 0;
  String? qrResult = qrResultInitialValue;

  _goToRecipe(String? code) {
    print(code);
    Navigator.pushNamed(context, viewRecipeRoute, arguments: code);
    setState(() {
      _selectedMenuItem = 0;
    });
  }

  Widget? navigateToMenuItem(int index) {
    switch (index) {
      case 0:
        return const RecipeListScreen();
      case 1:
        return Scan(onDetect: _goToRecipe);
    }
    return null;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedMenuItem = index;
    });
  }

  void updateScanResult(String? code) {
    setState(() {
      qrResult = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cookit!"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        bottomNavigationBar: Menu(
          onTap: _onItemTapped,
          currentIndex: _selectedMenuItem,
        ),
        body: navigateToMenuItem(_selectedMenuItem));
  }
}
