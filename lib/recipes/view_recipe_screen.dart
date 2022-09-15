import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/app_db.dart';

class ViewRecipeScreen extends StatelessWidget {
  final int id;

  const ViewRecipeScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Recipe>(
        future: Provider.of<MyDatabase>(context).getRecipe(id),
        builder: (context, snapshot) {
          final Recipe? recipe = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (recipe != null) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text("Recipe"),
                  backgroundColor: Colors.green,
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Text(recipe.id.toString()),
                    Text(recipe.title.toString()),
                    Text(recipe.code.toString())
                  ],
                ));
          }
          return const Text("No  data found");
        });
  }
}
