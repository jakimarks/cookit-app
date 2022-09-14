import 'package:flutter/material.dart';
import 'package:my_app/data/app_db.dart';
import 'package:my_app/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Provider<MyDatabase>(
    create: (context) => MyDatabase(),
    child: const MaterialApp(
      home: MyApp(),
    ),
    dispose: (context, db) => db.close(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}
