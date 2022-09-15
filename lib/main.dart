import 'package:flutter/material.dart';
import 'package:my_app/data/app_db.dart';
import 'package:my_app/route/routes.dart';
import 'package:provider/provider.dart';
import 'package:my_app/route/route_generator.dart';

void main() {
  runApp(Provider<MyDatabase>(
    create: (context) => MyDatabase(),
    child: const MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: homeRoute,
    ),
    dispose: (context, db) => db.close(),
  ));
}
