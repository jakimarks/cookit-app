import 'package:flutter/material.dart';
import 'package:my_app/recipes/recipe_list_screen.dart';
import 'package:my_app/recipes/view_recipe_screen.dart';
import 'package:my_app/route/routes.dart';

import '../home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case listRecipeRoute:
        return MaterialPageRoute(builder: (_) => const RecipeListScreen());
      case viewRecipeRoute:
        if (args is int) {
          return MaterialPageRoute(builder: (_) => ViewRecipeScreen(id: args));
        } else if (args is String) {
          return MaterialPageRoute(
              builder: (_) => ViewRecipeScreen(code: args));
        }
        return _errorRoute(settings);
      default:
        return _errorRoute(settings);
    }
  }

  static Route<dynamic> _errorRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body:
                  Center(child: Text('No route defined for ${settings.name}')),
            ));
  }
}
