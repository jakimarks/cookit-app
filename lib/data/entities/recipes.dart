import 'package:drift/drift.dart';

class Recipes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 5, max: 100)();

  TextColumn get code => text().withLength(min: 5, max: 100)();

  TextColumn get imagePath => text()();
}
