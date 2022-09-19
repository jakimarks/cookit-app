import 'package:drift/drift.dart';

class Recipes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get code => text()();

  TextColumn get imagePath => text()();
}
