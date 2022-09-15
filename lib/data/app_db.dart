import 'package:drift/drift.dart';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:my_app/data/entities/recipes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Recipes])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator m) async {
      await m.createAll();

      await insertRecipe(const RecipesCompanion(
          title: Value("Spaghetti Carbonara"), code: Value("cookit!#1")));
      await insertRecipe(const RecipesCompanion(
          title: Value("Flammkuchen"), code: Value("cookit!#2")));
    });
  }

  Future<List<Recipe>> getRecipes() async {
    return await select(recipes).get();
  }

  Future<Recipe> getRecipe(int id) async {
    return await (select(recipes)..where((r) => r.id.equals(id))).getSingle();
  }

  Future<Recipe?> getRecipeByCode(String code) async {
    return await (select(recipes)..where((r) => r.code.equals(code)))
        .getSingleOrNull();
  }

  Future<int> insertRecipe(RecipesCompanion recipe) async {
    return await into(recipes).insert(recipe);
  }
}
