import '../models/roadmap_data_models.dart';

// Helper to extract emoji and title
Map<String, String> _extractEmojiAndTitle(String rawName) {
  final parts = rawName.split(' ');
  if (parts.length > 1 && parts[0].length > 0 && (parts[0].codeUnitAt(0) > 255 || parts[0].contains(RegExp(r'[🧱🚀📱📦🗃🔒🧪✨]')))) { // Basic emoji check
    return {'emoji': parts[0], 'title': parts.sublist(1).join(' ')};
  }
  return {'emoji': '', 'title': rawName};
}


final List<RoadmapPart> sampleRoadmapData = [
  RoadmapPart(
    id: 'part1',
    title: _extractEmojiAndTitle('🧱 Part 1: Fundamentals of Dart Programming')['title']!,
    iconEmoji: _extractEmojiAndTitle('🧱 Part 1: Fundamentals of Dart Programming')['emoji']!,
    description: 'Dart is an object-oriented, class-based, garbage-collected language developed by Google. It\'s the core language behind Flutter. Learning Dart thoroughly is essential to becoming a confident Flutter developer.',
    sections: [
      Section(
        id: 'dart-basics',
        name: 'Dart Basics',
        // description: '', // No specific description for topics in original JS data
        skills: [
          Skill(
            id: 'part1_dart_variables',
            name: 'Variables and Data Types',
            description: 'var, final, const, late, and basic types like int, double, String, bool, dynamic',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_dart_operators',
            name: 'Operators',
            description: 'Arithmetic, relational, logical, bitwise, assignment, null-aware operators',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_dart_control_flow',
            name: 'Control Flow Statements',
            description: 'if/else, switch/case, for loops, while loops, break, continue',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_dart_functions',
            name: 'Functions',
            description: 'Function declaration, parameters, named parameters, anonymous functions, arrow syntax',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'collections',
        name: 'Collections',
        skills: [
          Skill(
            id: 'part1_coll_lists',
            name: 'Lists',
            description: 'Creating and manipulating lists, spread operator, collection if/for',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_coll_sets',
            name: 'Sets',
            description: 'Creating sets, operations like union and intersection',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_coll_maps',
            name: 'Maps',
            description: 'Key-value pairs, accessing and iterating through maps',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'null-safety',
        name: 'Null Safety',
        skills: [
          Skill(
            id: 'part1_null_nullable_types',
            name: 'Nullable & Non-nullable Types',
            description: 'Understanding type safety with nullable String? vs non-nullable String',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_null_null_operators',
            name: 'Null-aware Operators',
            description: '??, ??=, ?. and late keyword usage',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_null_null_assertion',
            name: 'Null Assertion',
            description: 'Using the ! operator when you know a value won\'t be null',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'oop',
        name: 'Object-Oriented Programming (OOP)',
        skills: [
          Skill(
            id: 'part1_oop_classes',
            name: 'Classes & Objects',
            description: 'Defining classes, creating objects, properties and methods',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_oop_constructors',
            name: 'Constructors',
            description: 'Default, named, redirecting, factory and const constructors',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_oop_inheritance',
            name: 'Inheritance',
            description: 'Extending classes, method overriding with @override',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_oop_abstract',
            name: 'Abstract Classes & Interfaces',
            description: 'Abstract classes, implicit interfaces with implements',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_oop_mixins',
            name: 'Mixins',
            description: 'Creating and using mixins with the with keyword',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_oop_enums',
            name: 'Enums',
            description: 'Basic enums and enhanced enums (Dart 2.17+) with methods and fields',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_oop_extensions',
            name: 'Extensions',
            description: 'Adding functionality to existing classes without modifying them',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      Section(
        id: 'async',
        name: 'Futures & Asynchronous Programming',
        skills: [
          Skill(
            id: 'part1_async_futures',
            name: 'Futures',
            description: 'Future objects, Future.delayed, then, catchError, whenComplete',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_async_async_await',
            name: 'Async/Await',
            description: 'Using async and await keywords for asynchronous code',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
          Skill(
            id: 'part1_async_streams',
            name: 'Streams',
            description: 'Working with streams, broadcast streams, StreamController, listening and transforming',
            priority: SkillPriority.mustLearn, // isRequired: true
            status: SkillStatus.notStarted,
          ),
        ],
      ),
      // Skipping "Error Handling", "Typedefs", "Higher-Order Functions", "Generics", "Dart Tools", "Advanced Dart Topics (Optional)"
      // from the original JS for brevity in this sample, but the structure is established.
    ],
    progress: 0.0, // Initial progress
  ),
  // More RoadmapPart objects would go here for other parts of the roadmap.
];
