import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'widgets/main_layout.dart';

void main() {
  // Wrap the entire application in a ProviderScope
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Skill Roadmap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          headline6: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          caption: TextStyle(fontSize: 12.0, color: Colors.grey),
          bodyText2: TextStyle(fontSize: 14.0),
        ),
        cardTheme: CardTheme(
          elevation: 2.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        ),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
      ),
      home: const MainLayout(),
    );
  }
}
