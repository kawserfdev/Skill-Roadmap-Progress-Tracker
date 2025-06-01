import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'models/roadmap_models.dart';
import 'state/roadmap_state.dart'; // Import RoadmapManager
import 'widgets/roadmap_part_card.dart';

// Sample Data - moved here to be accessible by RoadmapManager initialization
final RoadmapPart samplePart1 = RoadmapPart(
  id: 'part1',
  name: '🧱 Part 1: Fundamentals of Dart Programming',
  description: 'Dart is an object-oriented, class-based, garbage-collected language developed by Google.',
  topics: [
    Topic(id: 'dart-basics', name: 'Dart Basics', skills: [
      SkillItem(id: 'variables', name: 'Variables and Data Types', description: 'var, final, const, late, and basic types like int, double, String, bool, dynamic', isRequired: true, status: SkillStatus.notStarted),
      SkillItem(id: 'operators', name: 'Operators', description: 'Arithmetic, relational, logical, bitwise, assignment, null-aware operators', isRequired: true, status: SkillStatus.inProgress),
    ]),
    Topic(id: 'collections', name: 'Collections', skills: [
      SkillItem(id: 'lists', name: 'Lists', description: 'Creating and manipulating lists, spread operator, collection if/for', isRequired: true, status: SkillStatus.complete),
      SkillItem(id: 'sets', name: 'Sets', description: 'Creating sets, operations like union and intersection', isRequired: false, status: SkillStatus.notStarted),
    ]),
  ]
);

final RoadmapPart samplePart2 = RoadmapPart(
  id: 'part2',
  name: '🚀 Part 2: Flutter Basics',
  description: 'Flutter is Google\'s UI toolkit for crafting natively compiled applications for mobile, web, and desktop from a single codebase.',
  topics: [
    Topic(id: 'flutter-sdk', name: 'Flutter SDK & Development Environment', skills: [
      SkillItem(id: 'install-flutter', name: 'Install Flutter SDK', description: 'Setting up the Flutter SDK on your development machine', isRequired: true, status: SkillStatus.notStarted),
    ]),
  ]
);

final List<RoadmapPart> initialSampleRoadmap = [samplePart1, samplePart2];


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => RoadmapManager(initialParts: initialSampleRoadmap),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Skill Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          error: const Color(0xFFDC2626),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 12.0, color: Colors.grey),
          headlineMedium: TextStyle(fontSize: 14.0),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: Colors.grey[200],
          labelStyle: const TextStyle(fontSize: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        )
      ),
      home: const RoadmapPage(),
    );
  }
}

class RoadmapPage extends StatelessWidget {
  const RoadmapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access RoadmapManager here. Data is now sourced from it.
    // The actual list of parts will be consumed by widgets further down if needed,
    // or directly here if RoadmapPage itself displays parts.
    // For now, the ListView.builder will get data from Provider.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Developer Roadmap'),
        // Placeholder for overall progress if needed in app bar
        // actions: [
        //   Consumer<RoadmapManager>(
        //     builder: (context, manager, child) {
        //       final progress = manager.calculateOverallProgress();
        //       return Center(
        //         child: Padding(
        //           padding: const EdgeInsets.only(right: 16.0),
        //           child: Text("Overall: ${(progress * 100).toStringAsFixed(0)}%"),
        //         ),
        //       );
        //     },
        //   ),
        // ],
      ),
      // Step 4: Basic UI for Controls (Placeholder)
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {/* TODO: Import */}, child: const Text("Import")),
            ElevatedButton(onPressed: () {/* TODO: Export */}, child: const Text("Export")),
            ElevatedButton(onPressed: () {/* TODO: Reset */}, child: const Text("Reset")),
          ],
        ),
      ),
      body: Consumer<RoadmapManager>( // Use Consumer to get roadmap data
        builder: (context, roadmapManager, child) {
          if (roadmapManager.roadmapParts.isEmpty) {
            return const Center(child: Text("No roadmap data loaded."));
          }
          return ListView.builder(
            itemCount: roadmapManager.roadmapParts.length,
            itemBuilder: (context, index) {
              final part = roadmapManager.roadmapParts[index];
              // Pass the part itself, RoadmapPartCard will use Provider for manager if needed for actions
              return RoadmapPartCard(part: part);
            },
          );
        },
      ),
    );
  }
}
