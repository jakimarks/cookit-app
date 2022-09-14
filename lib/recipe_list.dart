import 'package:flutter/material.dart';
import 'package:my_app/data/app_db.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({super.key});

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipes'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Recipe>>(
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
                    return Card(
                        child: Column(
                      children: [
                        Text(recipe.id.toString()),
                        Text(recipe.title.toString()),
                        Text(recipe.code.toString())
                      ],
                    ));
                  });
            }

            return const Text("No  data found");
          },
        ));
  }
}
