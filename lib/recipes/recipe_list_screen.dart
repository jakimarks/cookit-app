import 'package:flutter/material.dart';
import 'package:my_app/data/app_db.dart';
import 'package:my_app/route/routes.dart';
import 'package:provider/provider.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
        future: Provider.of<MyDatabase>(context).getRecipes(),
        builder: (context, snapshot) {
          final List<Recipe>? recipes = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (recipes != null) {
            return ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, viewRecipeRoute,
                            arguments: recipe.id);
                      },
                      child: Card(
                          child: Column(
                        children: [
                          Text(recipe.id.toString()),
                          Text(recipe.title.toString()),
                          Text(recipe.code.toString())
                        ],
                      )));
                });
          }

          return const Text("No  data found");
        });
  }
}
